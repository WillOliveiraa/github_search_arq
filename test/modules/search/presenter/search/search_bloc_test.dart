import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search_arq/modules/search/domain/entities/result_search.dart';
import 'package:github_search_arq/modules/search/domain/errors/errors.dart';
import 'package:github_search_arq/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search_arq/modules/search/presenter/search/serach_bloc.dart';
import 'package:github_search_arq/modules/search/presenter/search/state/state.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements SearchByText {}

main() {
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);

  test("Deve retornar os estados na ordem correta", () {
    when(usecase.call(any)).thenAnswer((_) async => Right(<ResultSearch>[]));

    expect(
        bloc.stream,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSuccess>(),
        ]));

    bloc.add("Willian");
  });

  test("Deve retornar error", () {
    when(usecase.call(any)).thenAnswer((_) async => Left(InvalidTextError()));

    expect(
        bloc.stream,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchError>(),
        ]));

    bloc.add("Willian");
  });
}
