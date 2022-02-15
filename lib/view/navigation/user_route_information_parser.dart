import 'package:flutter/material.dart';
import 'package:wajve_coding_challenge/view/navigation/user_route_path.dart';

class UserRouteInformationParser extends RouteInformationParser<UserRoutePath> {

  @override
  Future<UserRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) return Home();

    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'users') return Home();

      final rawId = uri.pathSegments[1];
      final id = int.tryParse(rawId);
      if (id == null) return Home();

      return Details(id);
    }

    return Home();
  }

  @override
  RouteInformation? restoreRouteInformation(UserRoutePath configuration) {
    if (configuration is Details) {
      final id = configuration.id;
      return RouteInformation(location: '/users/$id');
    }
    if (configuration is Home) {
      return const RouteInformation(location: '/');
    }
  }
}
