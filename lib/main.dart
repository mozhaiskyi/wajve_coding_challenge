import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wajve_coding_challenge/domain/model/page.dart';
import 'package:wajve_coding_challenge/domain/repository/user_repository.dart';
import 'package:wajve_coding_challenge/provider.dart';

import 'domain/model/user.dart';

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
    final userRepository = Provider.of<UserRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<DataPage<User>>(
        future: userRepository.getUsers(1),
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
