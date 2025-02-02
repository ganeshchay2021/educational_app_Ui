// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:educational_app_ui/utils/app_colors.dart';
import 'package:educational_app_ui/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class MyTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;

  const MyTabView({
    super.key,
    required this.changeTab,
    required this.index,
  });

  @override
  State<MyTabView> createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  final List<String> myList = ["Playlist(22)", "Description"];

  Widget buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.index == index ? primaryColor1 : null,
        ),
        child: UiHelper.customText(
          text: myList[index],
          fontSize: 16,
          color: widget.index == index ? Colors.white : Colors.black,
          fontWeight:
              widget.index == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: myList
            .asMap()
            .entries
            .map(
              (MapEntry map) => buildTags(map.key),
            )
            .toList(),
      ),
    );
  }
}
