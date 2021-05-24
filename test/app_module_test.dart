import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_arq/app_module.dart';
import 'package:github_search_arq/modules/search/domain/entities/result_search.dart';
import 'package:github_search_arq/modules/search/domain/usecases/search_by_text.dart';
import 'package:mockito/mockito.dart';

import 'modules/external/utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  initModule(AppModule(), replaceBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test("Deve recuperar o usecase sem erro", () {
    final usecase = Modular.get<SearchByText>();

    expect(usecase, isA<SearchByTextImpl>());
  });

  test("Deve trazer uma lista de ResultSeachr", () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(githubResult), statusCode: 200, requestOptions: null));

    final usecase = Modular.get<SearchByText>();
    final result = await usecase("Will");

    expect(result | null, isA<List<ResultSearch>>());
  });
}
