import 'package:bloc/bloc.dart';
import 'package:github_search_arq/modules/search/domain/usecases/search_by_text.dart';
import 'package:github_search_arq/modules/search/presenter/search/state/state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByText usecase;

  SearchBloc(this.usecase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();

    final result = await usecase(searchText);

    yield result.fold((l) => SearchError(l), (r) => SearchSuccess(r));
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 800)), transitionFn);
  }
}
