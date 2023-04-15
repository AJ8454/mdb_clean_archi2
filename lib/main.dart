import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdb_clean_archi/data/network/client/api_client.dart';
import 'package:mdb_clean_archi/data/network/network_mapper.dart';
import 'package:mdb_clean_archi/data/repository/movie_repo.dart';
import 'package:mdb_clean_archi/domain/model/config.dart';
import 'package:mdb_clean_archi/presentation/app/mdb_app.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class InitialData {
  final List<SingleChildWidget> providers;
  InitialData({required this.providers});
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final data = await _createData();

  runApp(MdbApp(data: data));
}

Future<InitialData> _createData() async {
  // load project config
  final config = await _loadConfig();

  // Data
  final apiClient = ApiClient(
    baseUrl: 'https://moviesdatabase.p.rapidapi.com/',
    apiKey: config.apiKey,
    apiHost: config.apiHost,
  );

  final networkMapper = NetowrkMapper();
  final movieRepo =
      MovieRepository(apiClient: apiClient, networkMapper: networkMapper);

  // create and return provider
  return InitialData(providers: [
    Provider<MovieRepository>.value(value: movieRepo),
  ]);
}

Future<Config> _loadConfig() async {
  String raw;

  try {
    raw = await rootBundle.loadString('assets/config/config.json');

    final config = json.decode(raw) as Map<String, dynamic>;

    return Config(
      apiKey: config['apiKey'] as String,
      apiHost: config['apiHost'] as String,
    );
  } catch (e) {
    print('error on laoad config json assets file $e');
    rethrow;
  }
}
