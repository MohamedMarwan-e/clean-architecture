import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCircleProgress extends StatelessWidget {
  final Color color;
  final double? size;
  const MyCircleProgress({super.key,this.color = Colors.lightBlue,this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CupertinoActivityIndicator(color: color,radius: size ?? 20)
    );
  }
}
