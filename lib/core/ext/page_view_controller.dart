import 'package:flutter/widgets.dart';

class PageViewController extends PageController {
  PageViewController({
    super.initialPage = 0,
    super.keepPage = true,
    super.viewportFraction = 1.0,
  });

  @override
  Future<void> animateToPage(int page,
      {required Duration duration, required Curve curve}) async {
    await super.animateToPage(page, duration: duration, curve: curve);
    notifyListeners();
  }

  @override
  Future<void> animateTo(double offset,
      {required Duration duration, required Curve curve}) async {
    await super.animateTo(offset, duration: duration, curve: curve);
    notifyListeners();
  }
}
