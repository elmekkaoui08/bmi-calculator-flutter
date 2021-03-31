import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onTap;
  const ReusableCard({@required this.color, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
      ),
    );
  }
}