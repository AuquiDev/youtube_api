import 'package:flutter/material.dart';
import 'package:youtube_api/ui/general/colors.dart';

class ItemFilterWidget extends StatelessWidget {
  ItemFilterWidget({super.key, required this.text,required this.isSelect});
  String text;
  bool isSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        child: Chip(
            backgroundColor:isSelect ? Colors.white : kbranSecondarycolor,
            labelStyle: TextStyle(color:isSelect ? Colors.black : Colors.white),
            label: Text(
              text,
            )));
  }
}
