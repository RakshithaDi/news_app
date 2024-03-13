import 'package:flutter/material.dart';

class Alerts {
  static showOkAlert(BuildContext context,
      {required String title,
      required String content,
      required void Function() onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onPressed();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static showConfirmationAlert(BuildContext context,
      {required String title,
      required String content,
      required void Function() onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                onPressed();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
