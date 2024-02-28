import 'package:flutter/material.dart';
import 'package:trust_wallet_desktop/features/auth/domain/auth_service.dart';

import '../crypt/domain/crypt.dart';
import 'home.dart';

abstract class HomeBloc extends State<HomeScreen> {
  final AuthService authService = AuthService();

  bool isSendHover = false;
  bool isReceiveHover = false;
  bool isBuyHover = false;
  List<Crypt>? crypts;
  Crypt? selectedCrypt;

  @override
  void initState() {
    crypts = authService.getCrypts();
    super.initState();
  }
}
