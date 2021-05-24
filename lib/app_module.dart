import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search_arq/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search_arq/modules/search/external/datasources/github_datasource.dart';
import 'package:github_search_arq/modules/search/infra/repositores/search_repository_impl.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => GithubDataSource(i())),
    Bind((i) => SearchRepositoryImpl(i())),
    Bind((i) => SearchByTextImpl(i())),
  ];

  @override
  final List<ModularRoute> routes = [];
}
