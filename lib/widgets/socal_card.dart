import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({Key key, this.icon, this.press, this.white})
      : super(key: key);

  final String icon;
  final Function press;
  final bool white;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(4.5),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: white ? Color(0xFFF5F6F9) : Colors.blueGrey[100],
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
