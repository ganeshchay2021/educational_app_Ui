import 'package:educational_app_ui/model/lesson.dart';
import 'package:educational_app_ui/utils/app_colors.dart';
import 'package:educational_app_ui/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          itemBuilder: (context, index) {
            final lesson = lessonList[index];
            return Row(
              children: [
                lesson.isPlaying
                    ? const Icon(
                        Icons.play_circle,
                        color: primaryColor1,
                        size: 40,
                      )
                    : const Icon(
                        Icons.play_circle_outlined,
                        size: 40,
                        color: primaryColor1,
                      ),
                      const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiHelper.customText(
                          text: lesson.name,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis),
                      UiHelper.customText(
                          text: lesson.duration,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis)
                    ],
                  ),
                ),
                lesson.isCompleted
                    ? const Icon(
                        Iconsax.tick_circle,
                        color: Colors.green,
                        size: 40,
                      )
                    : const Icon(
                        Iconsax.lock_circle,
                        size: 40,
                        color: Colors.amber,
                      ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: lessonList.length),
    );
  }
}
