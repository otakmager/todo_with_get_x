import 'package:flutter/material.dart';

dialogLoading() {
  return const AlertDialog(
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Loading'),
      ],
    ),
    content: SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 32,
        ),
        Text("Loading..."),
      ],
    )),
  );
}
