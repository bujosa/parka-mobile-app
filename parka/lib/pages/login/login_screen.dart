import 'package:ParkA/components/buttons/round_button.dart';
import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/pages/register/register_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/components/curve-painter/curves_painter.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'email_login.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: WavyClipper.withBottomWave(
              child: Container(
                alignment: Alignment.centerLeft,
                color: ParkaColors.parkaGreen,
                child: Icon(
                  ParkaIcons.parkaCar,
                  color: Colors.white,
                  size: 130.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Bienvenido a ParkA",
                    // textAlign: TextAlign.center,
                    style: kParkaBigTitleTextStyle,
                  ),
                  Text(
                    "Simplificando la busqueda y alquiler de parqueos",
                    style: kParkaTextBaseStyleBold,
                  ),
                  RoundedButton(
                    color: ParkaColors.parkaFacebookBlue,
                    icon: FontAwesomeIcons.facebookF,
                    label: "Iniciar sesion con Facebook",
                    hasIcon: true,
                    hasShadow: false,
                  ),
                  RoundedButton(
                    color: ParkaColors.parkaGoogleRed,
                    icon: FontAwesomeIcons.google,
                    label: "Iniciar sesion con Google",
                    hasIcon: true,
                    hasShadow: false,
                  ),
                  TransparentButton(
                    label: "Iniciar Sesion con Correo",
                    color: ParkaColors.parkaGreen,
                    buttonTextStyle: kParkaTextBaseStyleBold,
                    onTapHandler: () {
                      Navigator.pushNamed(context, EmailLogin.routeName);
                    },
                  ),
                  TransparentButton(
                    label: "Registrarse",
                    color: ParkaColors.parkaGreen,
                    buttonTextStyle: kParkaTextBaseStyleBold,
                    onTapHandler: () {
                      Navigator.pushNamed(context, RegisterPage.routeName);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}