import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';

showBottomDialog(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return child;
    },
  );
}

showSnackBar(BuildContext context, String content, Icon icon) {
  final size = MediaQuery.of(context).size;

  Flushbar(
    maxWidth: size.width * .8,
    borderRadius: BorderRadius.circular(10),
    backgroundColor: Colors.white,
    flushbarPosition: FlushbarPosition.BOTTOM,
    messageColor: const Color(0xFF1D1E2C),
    messageSize: 16,
    message: content,
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    icon: icon,
    boxShadows: [
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 6,
        color: const Color(0xFFBABABA).withOpacity(
          0.217,
        ),
      )
    ],
    duration: const Duration(seconds: 3),
  ).show(context);
}