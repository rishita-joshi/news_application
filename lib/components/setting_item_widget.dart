import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsItemWidget extends StatefulWidget {
  SettingsItemWidget({
    super.key,
    required this.trailingWidget,
    required this.titleText,
    required this.onTapFunction,
    required this.textColor,
  });

  final Widget trailingWidget;
  final String titleText;
  final Function() onTapFunction;
  final Color textColor;

  @override
  State<SettingsItemWidget> createState() => _SettingsItemWidgetState();
}

class _SettingsItemWidgetState extends State<SettingsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.titleText,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: widget.textColor),
      ),
      trailing: widget.trailingWidget,
      onTap: widget.onTapFunction,
    );
  }
}
