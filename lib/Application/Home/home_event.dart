part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getLanguages() = GetLanguages;

  const factory HomeEvent.isSelectedLang({
    required String newSourceLang,
    required String newTargetLang,
    required String newSourceCode,
    required String newTargrtCode
  }) = IsSelectedLang;

  const factory HomeEvent.getTranslatedText({
    required String source,
    required String target,
    required String text,
  }) = GetTranslatedText;
  
  const factory HomeEvent.getLeng({
    required int newLen,
  }) = GetLeng;
  
}