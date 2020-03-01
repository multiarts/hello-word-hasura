import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hello_word/app/modules/home/home_controller.dart';
import 'package:mobx/mobx.dart';

typedef StringValue = TickerFuture Function(TickerFuture);

// ignore: must_be_immutable
class IconBadge extends StatefulWidget {

  final IconData icon;
  // final double size;
  final String total;
  StringValue callback;

  IconBadge({Key key, this.icon, this.total, this.callback})
      : super(key: key);


  @override
  _IconBadgeState createState() => _IconBadgeState();
}

class _IconBadgeState extends State<IconBadge>  with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;

  _animar(){
    animationController.forward();
  }

  ReactionDisposer disposer;

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    animation = Tween<double>(begin: 12, end: 0).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceIn));

    animation.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      }
    });
    disposer = reaction((_) => controller.totalCart, (anim) => _animar());
  }

  @override
  void dispose(){
    disposer();
    animationController.dispose();
    super.dispose();
  }

  final controller = Modular.get<HomeController>();  

  @override
  Widget build(BuildContext context) {
    
    return IconButton(
      onPressed: (){
        widget.callback(animationController.forward());
      },
      icon: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AnimatedBuilder(
            animation: animationController,
            builder: (_, child){
              return Icon(
                widget.icon,
                // size: animation.value,
              );
            }, 
          ),
          controller.totalCart == 0 
          ? SizedBox()
          : AnimatedBuilder(animation: animation, builder: (_, child){
            return Positioned(
            top: -5,
            left: animation.value,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: Colors.pink[300],
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(5)
              ),
              constraints: BoxConstraints(
                minWidth: 20,
                minHeight: 15,
              ),
              child: Text(
                widget.total,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.center,
              )
            ),
          );
          },
          
          )
        ],
      ),
    );
  }
}