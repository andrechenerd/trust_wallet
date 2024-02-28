import 'package:flutter/material.dart';

class ImageCollection {
  final String _defaultPath = 'assets/';

  String _name(String name) => _defaultPath + name;

  // Example

  Image trust({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/trust.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image welcome({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/welcome.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image welcome1({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/welcome1.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image welcome2({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/welcome2.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image welcome3({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/welcome3.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image backup({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/backup.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image home({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/home.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image buy({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('icons/buy.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image receive({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('icons/receive.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image send({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('icons/send.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image crypto({String? value, double? width, double? height, BoxFit? fit}) =>
      Image.asset(
        _name('crypto/$value.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
}
