import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CashAlertDialog extends StatelessWidget {
  const CashAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(translate('error')),
      content:  Text(translate('not enough cash!')),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(translate('okay')),
        )
      ],
    );
  }
}
