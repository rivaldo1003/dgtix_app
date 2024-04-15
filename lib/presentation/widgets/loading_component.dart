import 'package:flutter/material.dart';

Future<dynamic> loading(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
