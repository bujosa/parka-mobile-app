import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Inputs/parka_input.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:ParkA/pages/Register/utils/utils.dart';
import 'package:flutter/material.dart';
import "package:ParkA/components/Utils/styles/text.dart";

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  static const String routeName = "/RegisterPage";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username, password, email, lastname, confirmpassword;
  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Header Column
            Expanded(
              flex: 0,
              child: ParkaHeader(),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 70,
                    color: ParkaColors.parkaGreen,
                  ),
                  Spacer(),
                  Text(
                    "Crear Cuenta",
                    textAlign: TextAlign.center,
                    style: kParkaPageTitleTextStyle,
                  ),
                  Spacer(
                    flex: 3,
                  )
                ],
              ),
            ),
            //Login Column
            Expanded(
              flex: 6,
              // fit: FlexFit.tight,
              child: WavyClipper.withTopWave(
                child: Container(
                  padding: EdgeInsets.fromLTRB(42, 20, 42, 15),
                  color: Color(0xFF0B768C),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: currentScreen.height * 0.02,
                              ),
                              ParkAInput(
                                icon: 'WhiteProfileIcon.svg',
                                text: 'Nombres',
                                onChanged: (username) {
                                  setState(() {
                                    this.username = username;
                                  });
                                },
                              ),
                              ParkAInput(
                                icon: 'WhiteProfileIcon.svg',
                                text: 'Apellidos',
                                onChanged: (lastname) {
                                  setState(() {
                                    this.lastname = lastname;
                                  });
                                },
                              ),
                              ParkAInput(
                                icon: 'Mail.svg',
                                text: 'Correo/Usuario',
                                onChanged: (email) {
                                  setState(() {
                                    this.email = email;
                                  });
                                },
                              ),
                              ParkAInput(
                                icon: 'WhiteLockIcon.svg',
                                text: 'Contraseña',
                                isPassword: true,
                                onChanged: (password) {
                                  setState(() {
                                    this.password = password;
                                  });
                                },
                              ),
                              ParkAInput(
                                icon: 'Lockcheck.svg',
                                text: 'Confirmar contraseña',
                                isPassword: true,
                                onChanged: (confirmpassword) {
                                  setState(() {
                                    this.confirmpassword = confirmpassword;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TransparentButton(
                                label: 'Continuar',
                                buttonTextStyle: kParkaButtonTextStyle,
                                trailingIconData: Icons.arrow_forward_ios,
                                color: Colors.white,
                                onTapHandler: () async => {
                                  Navigator.pushNamed(
                                    context,
                                    ProfilePicPage.routeName,
                                    arguments: await createUser(
                                        this.username,
                                        this.lastname,
                                        this.email,
                                        this.password),
                                  )
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
