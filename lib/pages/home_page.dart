import 'package:flutter/material.dart';
import 'package:flutter_flashcard/animations/fade_in_animation.dart';
import 'package:flutter_flashcard/pages/review_page.dart';
import 'package:flutter_flashcard/pages/settings_page.dart';
import 'package:provider/provider.dart';

import '../component/home_page/topic_tile.dart';
import '../configs/constants.dart';
import '../data/words.dart';
import '../notifier/flashcards_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _topics = [];

  @override
  initState() {
    super.initState();
    for (var t in words) {
      if (!_topics.contains(t.topic)) {
        _topics.add(t.topic);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        toolbarHeight: size.height * 0.15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<FlashcardNotiFier>(
                      context,
                      listen: false,
                    ).setTopic(topic: 'Settings');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPages()),
                    );
                  },
                  child: SizedBox(
                    width: size.width * kIconPadding,
                    child: Image.asset('assets/images/Settings.png'),
                  ),
                ),
                SizedBox(height: size.height * kIconPadding),
              ],
            ),
            const FadeInAnimation(
              child: Text(
                "English Flashcards\nTiếng Anh Thẻ Nhớ",
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<FlashcardNotiFier>(
                      context,
                      listen: false,
                    ).setTopic(topic: 'Review');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReviewPage()),
                    );
                  },
                  child: SizedBox(
                    width: size.width * kIconPadding,
                    child: Image.asset('assets/images/Review.png'),
                  ),
                ),
                SizedBox(height: size.height * kIconPadding),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.10),
                  child: FadeInAnimation(
                    child: Image.asset('assets/images/bigben.png'),
                  ),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: _topics.length,
                (context, index) => TopicTitle(topic: _topics[index]),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
