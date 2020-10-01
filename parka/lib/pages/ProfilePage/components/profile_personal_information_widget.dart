import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/pages/ProfilePage/components/parka_circle_avatar_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import "package:ParkA/components/Utils/styles/text.dart";
import 'package:get/get.dart';

class ProfilePersonalInformationWidget extends StatelessWidget {
  final UserController userController = Get.find();

  final Color color;
  final bool showLocation;

  ProfilePersonalInformationWidget({
    Key key,
    this.color,
    @required this.showLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String userName = userController.user.value != null
    //     ? '${userController.user.value.name} ${userController.user.value.lastName}'
    //     : "login";

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: ParkaCircleAvatarWidget(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Obx(
                    () => AutoSizeText(
                      userController.user.value != null
                          ? '${userController.user.value.name} ${userController.user.value.lastName}'
                          : "Iniciar sesion",
                      maxLines: 1,
                      minFontSize: 14.0,
                      style: kParkaTextBaseStyleBold.copyWith(
                        color: this.color,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    this.showLocation
                        ? Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: this.color,
                              ),
                              Text(
                                "Santo Domingo",
                                style: kParkaInputDefaultSyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              ),
                              VerticalDivider(
                                thickness: 1.0,
                                color: Color(0xFF949494),
                              ),
                            ],
                          )
                        : Container(),
                    userController.user.value != null
                        ? Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: this.color,
                              ),
                              Text(
                                "4.20",
                                style: kParkaInputDefaultSyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
