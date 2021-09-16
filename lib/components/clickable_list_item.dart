import 'package:flutter/material.dart';

class ClickableListItem extends StatelessWidget {
  const ClickableListItem(
      {Key? key,
      required this.title,
      this.textStyle,
      this.leading,
      this.trailing,
      this.margin})
      : super(key: key);

  final String title;
  final Icon? leading;
  final Icon? trailing;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: margin ?? EdgeInsets.only(bottom: 1),
        elevation: 0,
        child: ListTile(
          title: Text(title, style: textStyle),
          leading: leading,
          trailing: trailing,
        ),
      ),
    );
  }
}
