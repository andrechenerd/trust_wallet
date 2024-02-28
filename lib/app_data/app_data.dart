import 'dart:io';

import 'package:logger/logger.dart';

import 'lib/action.dart';
import 'lib/assets/assets.dart';
import 'lib/colors.dart';
import 'lib/constants.dart';
import 'lib/custom_console_output.dart';
import 'lib/routes.dart';
import 'lib/theme/decoration_collection.dart';
import 'lib/theme/theme.dart';
import 'lib/utils.dart';

abstract class AppData {
  static Logger get logger => Logger(
        printer: PrefixPrinter(
          PrettyPrinter(
            methodCount: 0,
            printTime: true,
            colors: Platform.isIOS ? false : true,
          ),
        ),
        output: CustomConsoleOutput(),
      );
  static AppTheme theme = AppTheme();
  static RoutesList routes = RoutesList();
  static Routes routesConfig = Routes();
  static Assets assets = Assets();
  static ColorsCollection colors = ColorsCollection();
  static const Constants constants = Constants();
  static DecorationCollection decorations = DecorationCollection();

  static Action action = Action();
  static Utils utils = Utils();
}
