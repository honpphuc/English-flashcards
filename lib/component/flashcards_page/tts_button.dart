import 'package:flutter/material.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class TTSButton extends StatefulWidget {
  const TTSButton({super.key});

  @override
  State<TTSButton> createState() => _TtsButtonState();
}

class _TtsButtonState extends State<TTSButton> {
  bool _isTapped = false;
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    // TODO: implement initState
    _setUpTts();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardNotiFier>(
      builder: (_, notifier, __) => Expanded(
        child: IconButton(
          onPressed: () {
            _runTts(text: notifier.word1.character);
            _isTapped = true;
            setState(() {});
            Future.delayed(Duration(milliseconds: 500), () {
              _isTapped = false;
              setState(() {});
            });
          },
          icon: Icon(
            Icons.audiotrack,
            size: 50,
            color: _isTapped ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  _setUpTts() async {
    await _tts.setLanguage("vi-VN");
    await _tts.setSpeechRate(0.40);
    await _tts.setPitch(1.0);
  }

  _runTts({required String text}) async {
    await _tts.speak(text);
  }
}
