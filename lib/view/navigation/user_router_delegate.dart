import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/domain/model/user.dart';
import 'package:wajve_coding_challenge/view/navigation/user_route_path.dart';
import 'package:wajve_coding_challenge/view/user_browser/user_browser_screen.dart';
import 'package:wajve_coding_challenge/view/user_details/user_details_screen.dart';

class UserRouterDelegate extends RouterDelegate<UserRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<UserRoutePath> {

  final _navigatorKey = GlobalKey<NavigatorState>();
  final _selectedUserId = ValueNotifier<int?>(null);
  User? _detailsScreenPayload;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(UserRoutePath configuration) async {
    if (configuration is Details) {
      _detailsScreenPayload = null;
      _selectedUserId.value = configuration.id;
    }  else {
      _detailsScreenPayload = null;
      _selectedUserId.value = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: _selectedUserId,
      builder: (_, userId, __) {
        return Navigator(
          key: _navigatorKey,
          pages: [
            MaterialPage(
              key: const ValueKey('user_browser'),
              child: UserBrowserScreen(
                onUserClicked: (user) {
                  _detailsScreenPayload = user;
                  _selectedUserId.value = user.id;
                },
              ),
            ),
            if (userId != null) MaterialPage(
              key: const ValueKey('user_details'),
              child: UserDetailsScreen(
                id: userId,
                payload: _detailsScreenPayload,
              ),
            ),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            _detailsScreenPayload = null;
            _selectedUserId.value = null;

            return true;
          },
        );
      }
    );
  }
}
