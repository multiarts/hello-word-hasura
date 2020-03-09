import 'package:flutter/material.dart';

class _AnimatedSlideToRight extends StatefulWidget {
  final Widget child;
  final bool isOpen;

  const _AnimatedSlideToRight({Key key, this.isOpen, @required this.child}) : super(key: key);

  @override
  __AnimatedSlideToRightState createState() => __AnimatedSlideToRightState();
}

class __AnimatedSlideToRightState extends State<_AnimatedSlideToRight> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1700));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (widget.isOpen) _controller.forward(from: 0);
    return SlideTransition(
      position: Tween(begin: Offset(-2, 0), end: Offset(1, 0)).animate(
        CurvedAnimation(curve: Curves.easeOutQuad, parent: _controller),
      ),
      child: widget.child,
    );
  }
}