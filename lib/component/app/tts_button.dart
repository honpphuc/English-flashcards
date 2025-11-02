import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../models/word.dart';

class TTSButton extends StatefulWidget {
  const TTSButton({super.key, required this.word, this.iconSize = 50});

  final Word word;
  final double iconSize;

  @override
  State<TTSButton> createState() => _TtsButtonState();
}

class _TtsButtonState extends State<TTSButton> {
  bool _isTapped = false;
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _setUpTts();
    });
    // TODO: implement initState

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
    return Expanded(
      child: IconButton(
        onPressed: () {
          _runTts(text: widget.word.character);
          _isTapped = true;
          setState(() {});
          Future.delayed(Duration(milliseconds: 500), () {
            _isTapped = false;
            setState(() {});
          });
        },
        icon: Icon(
          Icons.audiotrack,
          size: widget.iconSize,
          color: _isTapped ? Colors.black : Colors.white,
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
