
import 'package:flutter/material.dart';
import 'package:flutter_flashcard/animations/fade_in_animation.dart';
import 'package:flutter_flashcard/configs/constants.dart';
import 'package:flutter_flashcard/utlis/methods.dart';

class TopicTitle extends StatelessWidget {
  const TopicTitle({
    super.key,
    required this.topic,
  }) ;

  final String topic;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: GestureDetector(
        onTap: (){
          print('tile tapped $topic');
          loadSession(context: context, topic: topic);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(kCircularBorderRadius),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                        tag: topic,
                        child: Image.asset('assets/images/$topic.png')),
                  ),
              ),
              Expanded(child: Text(topic)),
            ],
          ),
        ),
      ),
    );
  }
}