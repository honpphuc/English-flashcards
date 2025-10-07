import 'package:flutter/material.dart';

import '../component/home_page/topic_tile.dart';
import '../configs/constants.dart';
import '../data/words.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List <String> _topics = [];

  @override
  initState(){

    super.initState();
    for (var t in words) {
      if (!_topics.contains(t.topic)) {
        _topics.add(t.topic);
      }
    }
      super.initState();
  }


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
                SizedBox(
                  width: size.width * kIconPadding,
                  child: Image.asset('assets/images/Settings.png'),
                ),
                SizedBox(height: size.height *kIconPadding,),
              ],
            ),
            Text("English Flashcards\nTiếng Anh Thẻ Nhớ", textAlign: TextAlign.center,),
            Column(
              children: [
                SizedBox(
                  width: size.width * kIconPadding,
                  child: Image.asset('assets/images/Review.png'),
                ),
                SizedBox(height: size.height *kIconPadding,),
              ],
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding:EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding:EdgeInsets.all(size.width * 0.10),
                  child: Image.asset('assets/images/bigben.png'),
                ),
              ),
            ),
            SliverGrid(delegate: SliverChildBuilderDelegate(
              childCount: _topics.length,
                (context, index) => TopicTitle(topic: _topics[index]),
            ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            )
            )
          ],
        ),
      ),
    );
  }
}

