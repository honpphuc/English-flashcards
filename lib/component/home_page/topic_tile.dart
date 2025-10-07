
import 'package:flutter/material.dart';

class TopicTitle extends StatelessWidget {
  const TopicTitle({
    Key? key,
    required this.topic,
  }) : super(key: key) ;

  final String topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('tile tapped $topic');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('assets/images/$topic.png'),
                ),
            ),
            Expanded(child: Text(topic)),
          ],
        ),
      ),
    );
  }
}