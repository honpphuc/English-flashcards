import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:flutter_flashcard/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

import '../../pages/home_page.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardNotiFier>(
      builder:  (_, notifier,__) => AlertDialog(
        title: Text(notifier.isSessionCompleted ? 'Round Completed' : 'Round Completed',
          textAlign: TextAlign.center,),
        actions: [
          Table(
            columnWidths: {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
            },
            children: [
              buildTableRow(title:'Total Round', stat: notifier.roundTally.toString()),
              buildTableRow(title:'No. Cards', stat: notifier.cardTally.toString()),
              buildTableRow(title:'No. Correct', stat: notifier.correctTally.toString()),
              buildTableRow(title:'No. Incorrect', stat: notifier.incorrectTally.toString()),
              buildTableRow(title:'Correct Percentage', stat: '${notifier.correctPercent.toString()}%'),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  notifier.isSessionCompleted ? SizedBox() : ElevatedButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                        FlashcardsPage(),),);
                  },
                      child: Text('Retest Incorrect Cards')),
                  ElevatedButton(onPressed: (){
                    notifier.reset();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(),
                        ),
                            (route) => false);
                  },
                      child: Text('Home'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow buildTableRow({required String title, required String stat}) {
    return TableRow(
      children: [
        TableCell(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        )),
        TableCell(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(stat, textAlign: TextAlign.right,),
        )),
      ],
    );
  }
}