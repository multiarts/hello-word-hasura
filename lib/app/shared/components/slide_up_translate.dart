import 'package:flutter/material.dart';

class SlideUpTranslate extends StatefulWidget {
  final Widget child;
  SlideUpTranslate({Key key, this.child}) : super(key: key);

  @override
  _SlideUpTranslateState createState() => _SlideUpTranslateState();
}

class _SlideUpTranslateState extends State<SlideUpTranslate> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Animation<Offset> _tween;
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    _animation = CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: _animationController);
    _tween = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0)
    ).animate(_animation);
    _scale = Tween(
      begin: 2.0,
      end: 1.0
    ).animate(_animation);

    Future.delayed(Duration(milliseconds: 300), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _tween,
      child: ScaleTransition(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}