import 'dart:developer';
import 'dart:math' hide log;

import 'package:url_launcher/url_launcher.dart';

class Action {
  Action();

  Future<void> phonePressed() async {
    launchUrl(Uri(scheme: 'tel', host: '8 800 2000 878'));
  }

  //ToDo: add error service and send error to it
  void sendError({exception, stackTrace}) async {
    log("exception $exception");
    log("stackTrace $stackTrace");
    // String? _token = AppData.mutable.userToken;
    // String? _email = UserService.to.profile.email;
    //
    // final PackageInfo info = await PackageInfo.fromPlatform();
    // final String platform = Platform.operatingSystem;
    // String? ip = await printIps();
    // final character = {
    //   'token': _token,
    //   'email': _email,
    //   "version": info.version,
    //   "buildNumber": info.buildNumber,
    //   "platform": platform,
    //   "packageId": info.packageName,
    //   "ip": ip,
    // };
    //
    // String? identifier;
    // final deviceInfoPlugin = DeviceInfoPlugin();
    // if (Platform.isAndroid) {
    //   var build = await deviceInfoPlugin.androidInfo;
    //   identifier = build.androidId;
    // } else if (Platform.isIOS) {
    //   var data = await deviceInfoPlugin.iosInfo;
    //   identifier = data.identifierForVendor;
    // }
    //
    // Sentry.configureScope(
    //       (scope) => scope.setContexts('character', character),
    // );
    //
    // Sentry.configureScope(
    //       (scope) => scope.user =
    //       SentryUser(id: _token ?? identifier, email: _email, ipAddress: ip),
    // );
    //
    // await Sentry.captureException(exception, stackTrace: stackTrace);
  }

  //ToDo: add error service and send error to it
  void sendInfo({required String message}) async {
    print('message $message');
    // String? _token = AppData.mutable.userToken;
    // String? _email = UserService.to.profile.email;
    //
    // final PackageInfo info = await PackageInfo.fromPlatform();
    // final String platform = Platform.operatingSystem;
    // String? ip = await printIps();
    // final character = {
    //   'token': _token,
    //   'email': _email,
    //   "version": info.version,
    //   "buildNumber": info.buildNumber,
    //   "platform": platform,
    //   "packageId": info.packageName,
    //   "ip": ip,
    // };
    //
    // Sentry.configureScope((scope) => scope.setContexts('character', character));
    // Sentry.configureScope(
    //       (scope) => scope.user = SentryUser(id: _token, email: _email),
    // );
    //
    // await Sentry.captureMessage(message);
  }

  Future<void> openUrl(String? uriString) async {
    try {
      if (uriString == null) return;
      final uri = Uri.parse(uriString);
      if (await canLaunchUrl(uri)) {
        launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }
    } catch (e, s) {
      print('cant open url $e $s');
    }
  }

  Map<String, int> getTargetSize({
    required int width,
    required int height,
    required int targetSize,
    required int minSize,
    bool square = false,
  }) {
    int targetWidth = targetSize;
    int targetHeight = targetSize;
    int targetSizeCount = targetSize ~/ minSize;

    final bool vertical = height > width;

    int sizeCountWidth = max(1, min(width ~/ minSize, targetSizeCount));
    int sizeCountHeight = max(1, min(height ~/ minSize, targetSizeCount));

    if (square) {
      final targetSquareSize = min(sizeCountWidth, sizeCountHeight) * minSize;
      if (vertical) {
        targetHeight = (targetSquareSize * (height / width)).toInt();
        targetWidth = targetSquareSize.toInt();
      } else {
        targetHeight = targetSquareSize.toInt();
        targetWidth = (targetSquareSize * (width / height)).toInt();
      }
    } else if (vertical) {
      targetHeight = minSize * sizeCountHeight;
      targetWidth = (targetHeight * (width / height)).toInt();
    } else {
      targetWidth = minSize * sizeCountWidth;
      targetHeight = (targetWidth * (height / width)).toInt();
    }

    return {
      "width": targetWidth,
      "height": targetHeight,
    };
  }

  String getImageUrl(String path) {
    const storageUrl = 'https://backend.allmetrics.co/storage/';
    return storageUrl + path;
  }
}
