import 'package:educational_app_ui/utils/app_colors.dart';
import 'package:educational_app_ui/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class HeaderPart extends StatelessWidget {
  const HeaderPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryLight,
            primaryColor1,
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UiHelper.customText(
                text: "Hello,\nGood Morning",
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: kPrimaryLight, shape: BoxShape.circle),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Search your topic",
              labelStyle: const TextStyle(
                color: Colors.black45,
              ),
              suffixIcon: const Icon(
                Icons.mic,
                size: 25,
                color: primaryColor1,
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 25,
                color: primaryColor1,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
