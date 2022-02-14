import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wajve_coding_challenge/data/network/dto/get_users_result.dart';
import 'package:wajve_coding_challenge/data/network/user_api_service.dart';
import 'package:wajve_coding_challenge/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Wajve',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Wajve'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final apiService = Provider.of<UserApiService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<GetUsersResult>(
        future: apiService.getUsers(page: 1),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data!.data.length.toString()));
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
