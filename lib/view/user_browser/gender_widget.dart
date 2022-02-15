import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';

class GenderWidget extends StatelessWidget {
  final Gender gender;
  final double size;

  const GenderWidget({Key? key, required this.gender, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IconData iconData;
    switch (gender) {
      case Gender.male:
        iconData = Icons.male;
        break;
      case Gender.female:
        iconData = Icons.female;
        break;
      default:
        return Container();
    }
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black87,
      ),
      child: Center(
        child: Container(
          height: size - 1,
          width: size - 1,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(child: Icon(iconData, size: size - 2, color: Colors.black87)),
        ),
      ),
    );
  }
}
