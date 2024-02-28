
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'setting_event.freezed.dart';


@freezed
abstract class SettingEvent with _$SettingEvent {
  const factory SettingEvent.onImageDeleteSuccess() = SettingEventOnImageDeleteSuccess;
  const factory SettingEvent.onImageDeleteFailure(Exception e) = SettingEventOnImageDeleteFailure;
  const factory SettingEvent.onFaceIndexResetSuccess() = SettingEventOnFaceIndexResetSuccess;
  const factory SettingEvent.onFaceIndexResetFailure(Exception e) = SettingEventOnFaceIndexResetFailure;
  const factory SettingEvent.onImageCaptionResetSuccess() = SettingEventOnImageCaptionResetSuccess;
  const factory SettingEvent.onImageCaptionResetFailure(Exception e) = SettingEventOnImageCaptionResetFailure;
  const factory SettingEvent.error(Exception e) = SettingEventError;
  const factory SettingEvent.loading() = SettingEventLoading;
  const factory SettingEvent.loaded() = SettingEventLoaded;
}