import 'package:flutter/material.dart';
import 'package:flutter_flashcard/component/app/custom_appbar.dart';
import 'package:flutter_flashcard/configs/constants.dart';
import 'package:flutter_flashcard/enums/language_type.dart';

import '../component/review_page/header_button.dart';
import '../component/review_page/language_button.dart';
import '../component/review_page/word_tile.dart';
import '../models/word.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _reviewWords = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHeight),
        child: CustomAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                HeaderButton(
                  title: 'Insert Card',
                  onPressed: () {
                    var initialWords = [
                      Word(
                        topic: "Sports",
                        english: "Tennis",
                        character: "Quần vợt",
                        vietnamese: "Quần vợt",
                      ),
                      Word(
                        topic: "Sports",
                        english: "Rugby",
                        character: "Bóng bầu dục",
                        vietnamese: "Bóng bầu dục",
                      ),
                      Word(
                        topic: "Sports",
                        english: "Golf",
                        character: "Gôn",
                        vietnamese: "Gôn",
                      ),
                    ];
                    _insertWords(words: initialWords);
                  },
                ),
                HeaderButton(
                  title: 'Clear Cards',
                  onPressed: () {
                    _clearAllWords();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _reviewWords.length,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.vertical,
                  child: WordTile(
                    index: index,
                    word: _reviewWords[index],
                    animation: animation,
                    onPressed: () {
                      _removeWord(word: _reviewWords[index]);
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                LanguageButton(languageType: LanguageType.image,),
                LanguageButton(languageType: LanguageType.english,),
                LanguageButton(languageType: LanguageType.character,),
                LanguageButton(languageType: LanguageType.vietnamese,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _insertWords({required List<Word> words}) {
    for (int i = 0; i < words.length; i++) {
      _reviewWords.insert(i, words[i]);
      _listKey.currentState?.insertItem(i);
    }
  }

  _removeWord({required Word word}) {
    var w = word;
    _listKey.currentState?.removeItem(
      _reviewWords.indexOf(w),
      (context, animation) => WordTile(word: w, animation: animation, index: _reviewWords.indexOf(w),),
    );
    _reviewWords.remove(w);
  }

  _clearAllWords() {
    for (int i = 0; i < _reviewWords.length; i++) {
      _listKey.currentState?.removeItem(
        0,
        (context, animation) =>
            WordTile(word: _reviewWords[i], animation: animation, index: i,),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reviewWords.clear();
    });
  }
}

