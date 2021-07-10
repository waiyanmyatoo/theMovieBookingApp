import 'package:flutter/material.dart';

void routeToNextPage(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void routeToPreviousPage(BuildContext context) {
  Navigator.pop(context);
}
