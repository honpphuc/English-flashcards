import 'package:flutter/material.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:flutter_flashcard/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

import '../../pages/home_page.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardNotiFier>(
      builder: (_, notifier, __) => AlertDialog(
        title: Text(
          notifier.isSessionCompleted ? 'Session Complete!' : 'Round Complete!',
          textAlign: TextAlign.center,
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              notifier.isSessionCompleted
                  ? SizedBox()
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlashcardsPage(),
                          ),
                        );
                      },
                      child: Text('Restest Incorrect Cards'),
                    ),
              ElevatedButton(
                onPressed: () {
                  notifier.reset();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                },
                child: Text('Home'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
