import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String defaultActionText,
  required VoidCallback onOkPressed, // `final` is unnecessary here
}) async {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: onOkPressed, // No need for `()=>`
            child: Text(defaultActionText),
          ),
        ],
      ),
    );
  }

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton( // ✅ Replaced FlatButton with TextButton
          onPressed: onOkPressed,
          child: Text(defaultActionText),
        ),
      ],
    ),
  );
}
