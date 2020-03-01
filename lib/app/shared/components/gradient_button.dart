// AUTHOR: João Mello

import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color backgroundColor;
  final LinearGradient gradient;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;
  final double elevation;
  final IconData icon;
  final Function onTap;
  final double borderRadius;

  const GradientButton({
    Key key,
    this.label = "GraientButton",
    this.fontSize,
    this.backgroundColor,
    this.gradient,
    this.textColor = Colors.white,
    this.borderColor,
    this.width,
    this.height = 50,
    this.elevation,
    this.icon,
    @required this.onTap,
    this.borderRadius = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: backgroundColor ?? Theme.of(context).accentColor,
      onPressed: onTap,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      elevation: elevation,
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 88.0,
              minHeight: 36.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: label == ''
              ? icon == null ? Container() : Icon(icon, color: textColor)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icon == null ? Container() : Icon(icon, color: textColor),
                    Container(width: icon == null ? 0 : 7),
                    Text(
                      label,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}