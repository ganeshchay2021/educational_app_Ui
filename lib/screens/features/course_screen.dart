// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:educational_app_ui/model/course.dart';
import 'package:educational_app_ui/screens/features/course_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:educational_app_ui/model/category.dart';
import 'package:educational_app_ui/utils/custom_icon_button.dart';
import 'package:educational_app_ui/utils/ui_helper.dart';

class CourseScreen extends StatefulWidget {
  final Category category;
  const CourseScreen({
    super.key,
    required this.category,
  });

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late List<Course> filteredCourse;
  @override
  void initState() {
    filteredCourse = courses
        .where((myCourses) => myCourses.categoryName == widget.category.name)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
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
                      height: 40,
                      width: 40,
                      color: Colors.white,
                      child: const Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  const Spacer(),
                  UiHelper.customText(
                    text: widget.category.name,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (context, index) {
                        final course = filteredCourse[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetailsScreen(
                                  course: course,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: UiHelper.networkImage(
                                      image: course.image,
                                      height: 60,
                                      width: 70),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      UiHelper.customText(
                                        height: 0,
                                        maxLine: 2,
                                        text: course.name,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      UiHelper.customText(
                                        height: 0,
                                        maxLine: 2,
                                        text: "Author ${course.author}",
                                        fontSize: 13,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      LinearProgressIndicator(
                                        value: course.completedPercentage,
                                      ),
                                      UiHelper.customText(
                                          text:
                                              "${course.completedPercentage * 100}% Completed")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: filteredCourse.length))
            ],
          ),
        ),
      ),
    );
  }
}
