import 'package:flutter/material.dart';
import 'package:hello_word/app/shared/components/slide_up_translate.dart';

class SlidingScafold extends StatefulWidget {
  final Widget appBar;
  final Widget scafoldHeader;
  final Widget scafoldBody;
  SlidingScafold({Key key, this.appBar, this.scafoldHeader, this.scafoldBody});

  @override
  _SlidingScafoldState createState() => _SlidingScafoldState();
}

class _SlidingScafoldState extends State<SlidingScafold> {
  Widget _bodyWrapper(Widget child) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.white,
      ),
      child: child,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(208, 222, 237, 1),
      appBar: widget.appBar,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                widget.scafoldHeader != null ? widget.scafoldHeader : Container(),
                Flexible(
                  child: SlideUpTranslate(
                    child: widget.scafoldBody != null ? _bodyWrapper(widget.scafoldBody) : Container()
                  ),
                ),
                // _bodyWrapper(widget.scafoldBody)
              ],
            );
          }
          return Row(
          children: <Widget>[
            widget.scafoldHeader != null
              ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: widget.scafoldHeader,
              )
              : Container(),
            widget.scafoldHeader != null ? SizedBox(width: 20,) : Container(),
            Flexible(
              child: SlideUpTranslate(
                child: widget.scafoldBody != null ? _bodyWrapper(widget.scafoldBody) : Container()
              ),
            ),
            SizedBox(width: 20,)
          ],
        );
        },
      ),
    );
  }
}