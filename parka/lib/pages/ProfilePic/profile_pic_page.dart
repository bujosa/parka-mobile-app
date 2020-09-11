import 'dart:io';
import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/ID/ID_page.dart';
import 'package:ParkA/pages/ProfilePic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql/client.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ProfilePicPage extends StatefulWidget {
  ProfilePicPage({Key key}) : super(key: key);
  Object arguments;
  static const String routeName = "/ProfilePicPage";

  @override
  _ProfilePicPageState createState() => _ProfilePicPageState();
}

class _ProfilePicPageState extends State<ProfilePicPage> {
  File _image;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final picker = ImagePicker();
    final QueryResult args = ModalRoute.of(context).settings.arguments;
    String id = args.data['createUser']['user']['id'];
    Future getImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(pickedFile.path);
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: screenSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Back Button
              ParkaHeader(
                color: ParkaColors.parkaGreen,
              ),
              //Title of the page
              Center(
                  child: Text(
                "Imagen De Perfil",
                textAlign: TextAlign.center,
                style: kParkaPageTitleTextStyle,
              )),
              // Image container
              Container(
                child: GestureDetector(
                  onTap: () => getImage(),
                  child: _image != null
                      ? ClipOval(child: Image.file(_image))
                      : SvgPicture.asset(
                          'resources/images/BlueProfileIcon.svg',
                          height: screenSize.height * 0.4,
                        ),
                ),
                height: screenSize.height * 0.4,
              ),
              // Buttons
              WavyClipper.withTopWave(
                type: 'IDPage',
                child: Container(
                  width: screenSize.width,
                  color: Color(0xFF0B768C),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenSize.height * 0.075,
                      ),
                      TransparentButton(
                        label: "Continuar",
                        color: Colors.white,
                        buttonTextStyle: kParkaBigButtonTextStyle,
                        onTapHandler: () async => {
                          Navigator.pushNamed(
                            context,
                            IDPage.routeName,
                            arguments: await updateUser(id, _image),
                          ),
                        },
                      ),
                      SizedBox(
                        height: screenSize.height * 0.05,
                      ),
                      TransparentButton(
                        label: "Omitir",
                        color: ParkaColors.parkaLightGreen,
                        buttonTextStyle: kParkaBigButtonTextStyle.copyWith(
                          color: ParkaColors.parkaLimeGreen,
                        ),
                        onTapHandler: () {
                          Navigator.pushNamed(context, IDPage.routeName,
                              arguments: id);
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.075),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
