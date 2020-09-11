import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import "package:flutter/material.dart";

class ParkaHeader extends StatelessWidget {
  final Color color;
  final Widget leading;
  final Widget trailing;

  const ParkaHeader({
    Key key,
    @required this.color,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(
          color: this.color,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          this.leading ??
              TransparentButton(
                label: "Atras",
                buttonTextStyle: kParkaInputDefaultSyle,
                color: this.color,
                leadingIconData: Icons.keyboard_arrow_left,
                onTapHandler: () {
                  Navigator.pop(context);
                },
              ),
          this.trailing ?? Container()
        ],
      ),
    );
  }
}
