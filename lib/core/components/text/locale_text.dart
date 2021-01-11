import 'package:flutter/material.dart';
import 'package:templeteproject/core/extansion/string_extansion.dart';

class LocaleText extends StatelessWidget {
  final String value;

  const LocaleText({Key key, @required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(value.locale);
  }
}
