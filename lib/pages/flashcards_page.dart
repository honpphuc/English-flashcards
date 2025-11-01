import 'package:flutter/material.dart';
import 'package:flutter_flashcard/configs/constants.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:provider/provider.dart';

import '../component/app/custom_appbar.dart';
import '../component/flashcards_page/card_1.dart';
import '../component/flashcards_page/card_2.dart';
import '../component/flashcards_page/progress_bar.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final flashcardNotifier = Provider.of<FlashcardNotiFier>(context, listen: false);
      flashcardNotifier.runSlideCard1();
      flashcardNotifier.generateAllSelectedWords();
      flashcardNotifier.generateCurrentWord(context: context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardNotiFier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kAppBarHeight),
            child: CustomAppBar()),
        body: IgnorePointer(
          ignoring: notifier.ignoreTouchers,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ProgressBar()),
              Card2(),
              Card1(),
            ],
          ),
        ),
      ),
    );
  }
}
