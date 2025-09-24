import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: Text("English Flashcards"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding:EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding:EdgeInsets.all(size.width * 0.10),
                  child: Text('home page image'),
                ),
              ),
            ),
            SliverGrid(delegate: SliverChildBuilderDelegate(
                (context, index) => Container(color: Colors.cyanAccent,)
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
