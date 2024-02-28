import 'package:flutter/material.dart';

class DecorationCollection {
  final shadowRounded = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: const [
      BoxShadow(
        blurStyle: BlurStyle.normal,
        blurRadius: 2,
        offset: Offset(0, 1),
        color: Color.fromRGBO(0, 0, 0, 0.25),
      ),
      BoxShadow(
        blurStyle: BlurStyle.normal,
        blurRadius: 3,
        offset: Offset(0, 1),
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
    ],
  );
  final shadowed = const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        blurStyle: BlurStyle.normal,
        blurRadius: 2,
        offset: Offset(0, 1),
        color: Color.fromRGBO(0, 0, 0, 0.25),
      ),
      BoxShadow(
        blurStyle: BlurStyle.normal,
        blurRadius: 3,
        offset: Offset(0, 1),
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
    ],
  );
}
