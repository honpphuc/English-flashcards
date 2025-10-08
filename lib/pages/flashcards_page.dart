import 'package:flutter/material.dart';
import 'package:flutter_flashcard/animations/slide_animation.dart';
import 'package:flutter_flashcard/enums/slide_direction.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:flutter_flashcard/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../component/app/custom_appbar.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Consumer<FlashcardNotiFier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: CustomAppBar()),
        body: SlideAnimation(
          direction: SlideDirection.leftIn,
          child: Center(
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.7,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
