import 'package:donate_clothes/ui/screens/setting_screen/setting_controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultContainer extends StatelessWidget {
  final Color backColor, circleColor, textColor;
  final String circleText, lang;
  final onTap;

  const DefaultContainer(
      {super.key,
      required this.circleText,
      required this.lang,
      required this.backColor,
      required this.circleColor,
      required this.textColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.find();
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 130,
        width: 160,
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black),
                        color: circleColor),
                    child: const Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 45,
                decoration: BoxDecoration(
                    color: controller.app,
                    borderRadius: BorderRadius.circular(75)),
                child: Text(
                  circleText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: controller.textApp),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                lang,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
