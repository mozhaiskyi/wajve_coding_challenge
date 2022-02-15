import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wajve_coding_challenge/provider.dart';
import 'package:wajve_coding_challenge/view/navigation/user_route_information_parser.dart';
import 'package:wajve_coding_challenge/view/navigation/user_router_delegate.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _routerDelegate = UserRouterDelegate();
  final _routeInformationParser = UserRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        title: 'Wajve',
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
      ),
    );
  }
}
