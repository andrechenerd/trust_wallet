import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Svg {
  final String _defaultPath = 'assets/';

  String _name(String name) {
    if (name.endsWith('.svg')) {
      return _defaultPath + name;
    } else {
      return '$_defaultPath$name.svg';
    }
  }

  ColorFilter? _getColorFilterFromColor(Color? color) =>
      color == null ? null : ColorFilter.mode(color, BlendMode.srcIn);

  // SvgPicture get formDefault => SvgPicture.asset(_name('form-default'));

  SvgPicture get dark => SvgPicture.asset(_name('icons/dark'));
  SvgPicture get preferences => SvgPicture.asset(_name('icons/preferences'));
  SvgPicture get price => SvgPicture.asset(_name('icons/price'));
  SvgPicture get push => SvgPicture.asset(_name('icons/push'));

  SvgPicture get security => SvgPicture.asset(_name('icons/security'));
  SvgPicture get walletConnected =>
      SvgPicture.asset(_name('icons/wallet_connected'));
  SvgPicture get wallet => SvgPicture.asset(_name('icons/wallet'));

  SvgPicture get portfolioTab => SvgPicture.asset(_name('icons/portfolio_tab'));
  SvgPicture get walletTab => SvgPicture.asset(_name('icons/wallet_tab'));
  SvgPicture get swapTab1 => SvgPicture.asset(_name('icons/swap_tab1'));
  SvgPicture get swapTab2 => SvgPicture.asset(_name('icons/swap_tab2'));

  List<SvgPicture> get swapTab => [swapTab1, swapTab2];

  SvgPicture get buyTab => SvgPicture.asset(_name('icons/buy_tab'));

  SvgPicture get import => SvgPicture.asset(_name('icons/import'));

  SvgPicture crypto({
    String? value,
    Color? color,
    double? size,
  }) =>
      SvgPicture.asset(
        _name('crypto/$value'),
        colorFilter: _getColorFilterFromColor(color),
        width: size,
      );
}
