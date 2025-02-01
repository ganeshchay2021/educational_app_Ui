import 'package:educational_app_ui/model/category.dart';
import 'package:educational_app_ui/screens/features/course_screen.dart';
import 'package:educational_app_ui/screens/features/widgets/header_part.dart';
import 'package:educational_app_ui/utils/app_colors.dart';
import 'package:educational_app_ui/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const HeaderPart(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiHelper.customText(
                    text: "Explore Categories",
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                TextButton(
                  onPressed: () {},
                  child: UiHelper.customText(
                    text: "See All",
                    color: primaryColor1,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseScreen(
                          category: categoryList[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 7,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Column(
                      children: [
                        UiHelper.assetImage(
                          height: 150,
                          image: categoryList[index].coverImage,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        UiHelper.customText(
                          text: categoryList[index].name,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        UiHelper.customText(
                          text: "${categoryList[index].noOfCourses} Courses",
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
