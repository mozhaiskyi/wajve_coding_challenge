import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/view/user_browser/gender_widget.dart';
import 'package:wajve_coding_challenge/view/util/color_generator.dart' as color_generator;

class AvatarWidget extends StatelessWidget {
  final String name;
  final Gender gender;
  final double size;

  const AvatarWidget({Key? key, required this.name, required this.gender, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircleAvatar(
              backgroundColor: color_generator.generateColorFromText(name),
              child: Center(
                child: Text(
                  name[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
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
