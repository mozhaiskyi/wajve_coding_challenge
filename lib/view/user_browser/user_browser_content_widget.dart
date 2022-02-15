import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/domain/bloc/user_fetching_cubit.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/view/user_browser/user_widget.dart';

class UserBrowserContentWidget extends StatelessWidget {
  final Content content;
  final Function()? onScrolledBottom;

  const UserBrowserContentWidget({Key? key, required this.content, this.onScrolledBottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: content.hasNextPage ? content.batches.length + 1 : content.batches.length,
      itemBuilder: (_, index) {
        if (index == content.batches.length) {
          onScrolledBottom?.call();
          return const _NextPageLoaderWidget();
        } else {
          final batch = content.batches[index];
          return Column(
            children: [
              _UserBatchWidget(title: 'Active', users: batch.active),
              _UserBatchWidget(title: 'Inactive', users: batch.inactive),
            ],
          );
        }
      },
    );
  }
}

class _NextPageLoaderWidget extends StatelessWidget {

  const _NextPageLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              'Loading...',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserBatchWidget extends StatelessWidget {
  final String title;
  final List<User> users;

  const _UserBatchWidget({Key? key, required this.title, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Container();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (_, index) => UserWidget(user: users[index]),
              ),
            ),
          )
        ],
      );
    }
  }
}
