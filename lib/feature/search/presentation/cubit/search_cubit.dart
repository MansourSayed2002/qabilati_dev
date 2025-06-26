import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/feature/search/domain/usecase/get_search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.getSearchUsecase) : super(SearchInitial());

  late GetSearchUsecase getSearchUsecase;
  List data = [];
  searching(String search) async {
    emit(SearchLoading());
    data.clear();
    var response = await getSearchUsecase.getSearch(search);
    if (response is ApiSuccess) {
      data = response.data;
      emit(SearchSuccess());
    } else if (response is ApiFailure) {
      data.clear();
      emit(SearchError());
    }
  }

  clearData(String value) {
    if (value.isEmpty) {
      data.clear();
      emit(SearchSuccess());
    }
  }
}
