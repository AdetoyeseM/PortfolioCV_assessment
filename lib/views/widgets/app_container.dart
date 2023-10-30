import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key, this.children, this.hP, this.vP})
      : super(key: key);
  final List<Widget>? children;
  final double? hP, vP;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: hP ?? 0, vertical: vP ?? 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ...children!
          ],
        ));
  }
}
