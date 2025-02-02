import 'package:educational_app_ui/model/course.dart';
import 'package:educational_app_ui/screens/features/widgets/description.dart';
import 'package:educational_app_ui/screens/features/widgets/my_tab_view.dart';
import 'package:educational_app_ui/screens/features/widgets/my_video_player.dart';
import 'package:educational_app_ui/screens/features/widgets/playlist.dart';
import 'package:educational_app_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:educational_app_ui/utils/custom_icon_button.dart';
import 'package:educational_app_ui/utils/ui_helper.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course course;
  const CourseDetailsScreen({
    super.key,
    required this.course,
  });

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: BottomSheet(
        backgroundColor: Colors.white,
        onClosing: () {},
        builder: (context) {
          return SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  CustomIconButton(
                    color: Colors.white,
                    height: 45,
                    width: 45,
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomIconButton(
                      color: primaryColor1,
                      height: 45,
                      width: 45,
                      onTap: () {},
                      child: Center(
                        child: UiHelper.customText(
                          text: "Enroll Now",
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIconButton(
                      height: 45,
                      width: 45,
                      color: Colors.white,
                      child: const Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: UiHelper.customText(
                      text: widget.course.name,
                      fontSize: 22,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const MyVideoPlayer(),
              const SizedBox(
                height: 15,
              ),
              UiHelper.customText(
                text: widget.course.name,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
              UiHelper.customText(
                text: 'Author: ${widget.course.author}',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    color: Colors.black45,
                  ),
                  UiHelper.customText(
                      text: "4.8 ",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
                  UiHelper.customText(
                    text: " 72 Hours",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                  ),
                  const Spacer(),
                  UiHelper.customText(
                    text: "\$5",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: primaryColor1,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MyTabView(
                changeTab: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                index: selectedIndex,
              ),
              selectedIndex == 0 ? const PlayList() : const Description()
            ],
          ),
        ),
      ),
    );
  }
}
