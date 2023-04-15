import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_translator/services/api_service.dart';
import '../../model/language_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<GetLanguages>((event, emit)async {
     final result =  await APIService.getLanguages();
      emit(state.copyWith(langList: result,),);
    });

    on<IsSelectedLang>((event, emit) {
      emit(state.copyWith(isSelectedSourceLang: event.newSourceLang, isSelectedTargetLang: event.newTargetLang, sourceLangCode: event.newSourceCode, targetLangCode: event.newTargrtCode));
    });

    on<GetTranslatedText>((event, emit) async{
      var data =await APIService.translations(source: event.source, target: event.target, text: event.text);
      emit(state.copyWith(translatedText: data),);
    });

    on<GetLeng>((event, emit) {
      emit(state.copyWith(sourceTextLen:event.newLen));
    });
  }
}
