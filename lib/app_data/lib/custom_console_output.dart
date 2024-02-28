import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class CustomConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(printWrapped);
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // This works too
  void printWrapped2(String text) => debugPrint(text, wrapWidth: 1024);
}
