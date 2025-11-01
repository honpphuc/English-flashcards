import 'package:flutter/material.dart';

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({ required this.title, required this.callback, required this.icon,
    super.key,
  });
  final Icon icon;
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1, thickness: 1,),
        ListTile(
          leading: icon,
          title: Text(title),
          onTap: callback,
        ),
      ],
    );
  }
}