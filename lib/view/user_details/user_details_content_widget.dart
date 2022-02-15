import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/domain/bloc/user_details_cubit.dart';
import 'package:wajve_coding_challenge/view/user_browser/avatar_widget.dart';
import 'package:wajve_coding_challenge/view/util/mail_sender.dart';

class UserDetailsContentWidget extends StatelessWidget {
  final Content content;

  const UserDetailsContentWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: AvatarWidget(
                    name: content.user.name,
                    gender: content.user.gender,
                    size: 80,
                  ),
                ),
              ),
              Text(
                content.user.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  content.user.email,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                sendMail(
                  email: content.user.email,
                  prefilledBody: 'Hi ${content.user.name}',
                );
              },
              child: Container(
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 16, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.mail, color: Colors.white, size: 18),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          'Send Mail',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
