import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:own_quest_app/app/commons/network/network_provider.dart';
import 'package:own_quest_app/app/commons/own_theme/components/button/button.variant.dart';
import 'package:own_quest_app/app/commons/own_theme/components/components.dart';
import 'package:own_quest_app/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:own_quest_app/app/commons/own_theme/core/tokens/support/illustrations/illustrations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double astronautPositionX = 0.0;
  double astronautPositionY = 0.0;

  @override
  void initState() {
    super.initState();
    _initAstronautAnimation();
  }

  void _initAstronautAnimation() {
    Timer.periodic(
      const Duration(milliseconds: 1200),
      (Timer timer) {
        setState(() {
          if (astronautPositionY == 0.0) {
            astronautPositionY = 10.0;
          } else {
            astronautPositionY = 0.0;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: tokens.colors.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: tokens.spacing.inline.xs,
        ),
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: tokens.spacing.stack.md),
              Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeInOut,
                  transform: Matrix4.translationValues(
                    astronautPositionX,
                    astronautPositionY,
                    0.0,
                  ),
                  width: 200,
                  child: const Illustration(Illustrations.planetAstronaut),
                ),
              ),
              SizedBox(height: tokens.spacing.stack.xl + tokens.spacing.stack.sm),
              OwnText(
                text: 'Login',
                style: TextStyle(
                  fontSize: tokens.font.size.xl,
                  fontWeight: tokens.font.weight.bold,
                ),
              ),
              SizedBox(height: tokens.spacing.stack.xxs),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: tokens.colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tokens.colors.white,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tokens.colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: tokens.spacing.stack.xs),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: TextStyle(
                    color: tokens.colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tokens.colors.white,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: tokens.colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: tokens.spacing.stack.xs),
              OwnButton(
                label: 'Entrar',
                type: OwnButtonType.primary,
                size: OwnButtonSize.sm,
                onPressed: () async {
                  final network = GetIt.I.get<NetworkProvider>();
                  final dio = await network.getNetworkInstanceForUrl(url: 'https://web-production-5842.up.railway.app');
                  dio.get('/api').then((value) {
                    print(value.data);
                  }).catchError((error) {
                    print(error);
                  });
                },
              ),
              SizedBox(height: tokens.spacing.stack.xs),
              OwnButton(
                label: 'Logar',
                type: OwnButtonType.primary,
                size: OwnButtonSize.sm,
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final token = prefs.getString('xDebuggingNetwork');
                  log(token ?? 'Nada', name: 'xDebuggingNetwork');
                },
              ),
              SizedBox(height: tokens.spacing.stack.xs),
              OwnButton(
                label: 'Salvar',
                type: OwnButtonType.primary,
                size: OwnButtonSize.sm,
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('xDebuggingNetwork', 'Teste');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
