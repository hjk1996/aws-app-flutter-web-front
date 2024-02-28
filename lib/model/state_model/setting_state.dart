


import 'package:freezed_annotation/freezed_annotation.dart';


part 'setting_state.freezed.dart';
part 'setting_state.g.dart';


@freezed
class SettingState with _$SettingState {
  factory SettingState({
    required bool loading,
  }) = _SettingState;
  factory SettingState.fromJson(Map<String, dynamic> json) =>
    _$SettingStateFromJson(json);
}