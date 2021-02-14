import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingFilling.square(),
    );
  }
}
