import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/view/user_browser/avatar_widget.dart';

class UserWidget extends StatelessWidget {
  final User user;
  final Function()? onClicked;

  const UserWidget({Key? key, required this.user, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClicked?.call(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: AvatarWidget(name: user.name, gender: user.gender, size: 40),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      user.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    user.email,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
