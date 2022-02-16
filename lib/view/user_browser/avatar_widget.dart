import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/view/user_browser/gender_widget.dart';
import 'package:wajve_coding_challenge/view/util/color_generator.dart' as color_generator;
import 'package:wajve_coding_challenge/view/util/initial_generator.dart' as initials_generator;

class AvatarWidget extends StatelessWidget {
  final String name;
  final Gender gender;
  final double size;

  const AvatarWidget({Key? key, required this.name, required this.gender, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color_generator.generateColorFromText(name);
    final textColor = color_generator.generateTextColorBasedOnBackgroundColor(backgroundColor);
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircleAvatar(
              key: const ValueKey('circle_avatar'),
              backgroundColor: backgroundColor,
              child: Center(
                child: Text(
                  initials_generator.generateInitialFromName(name: name),
                  style: TextStyle(
                    fontSize: size / 3,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GenderWidget(gender: gender, size: size / 3),
          ),
        ],
      ),
    );
  }
}
