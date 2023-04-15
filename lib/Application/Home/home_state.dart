part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<dynamic>? langList,
    required String isSelectedSourceLang,
    required String isSelectedTargetLang,
    required String? sourceLangCode,
    required String? targetLangCode,
    required String? translatedText,
    required int sourceTextLen,
  }) = _Initial;

  factory HomeState.initial() {
    return const HomeState(langList: null, isSelectedSourceLang: 'Select Language', isSelectedTargetLang: 'Select Language', targetLangCode: null, sourceLangCode: null, translatedText: null, sourceTextLen: 0);
  }
}
