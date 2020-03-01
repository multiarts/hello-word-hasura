import 'package:flutter/material.dart';

class CustomChipWidget extends StatelessWidget {
  final int index;
  final String label;
  final bool selected;
  final Function() onSelected;

  const CustomChipWidget({Key key, this.index, this.label, this.selected, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        margin: EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: selected ? BorderRadius.circular(30) : BorderRadius.circular(10),
          color: selected ? Colors.primaries[index % Colors.primaries.length] : Colors.primaries[index % Colors.primaries.length].withOpacity(.7),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: selected ? Colors.primaries[index % Colors.primaries.length] : Colors.transparent,
            )
          ]
        ),
        child: Text(
          label,
          // style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white, fontWeight: FontWeight.w600,)
        ),
      ),
    );
  }
}