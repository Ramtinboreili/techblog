import 'package:flutter/material.dart';
import 'package:techblog/color_manager.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/text_style_manager.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: const Color.fromARGB(193, 112, 112, 112),
      indent: size.width/5,
      endIndent: size.width/5,
      );
  }
}

// ignore: must_be_immutable
class MainTag extends StatelessWidget {
    MainTag({
    required this.index ,
    super.key,
  });
  var index ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 6, 4),
        child: Row(
          children: [
            // ImageIcon(),
            const Icon(
              Icons.tag,
              color: Colors.white,
            ),
            const SizedBox(
              width: 6,
            ),
            Center(
              child: Text(
                taglist[index].title,
                style: TextStyleManager.tagTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
