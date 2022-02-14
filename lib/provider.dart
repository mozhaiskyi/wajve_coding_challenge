import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;
import 'package:wajve_coding_challenge/data/network/user_api_service.dart';

final providers = <SingleChildWidget>[
  Provider(create: (_) => http.Client()),
  ProxyProvider<http.Client, UserApiService>(
    update: (_, client, __) => UserApiServiceImpl(client: client),
  ),
];
