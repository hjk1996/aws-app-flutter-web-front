

import 'package:freezed_annotation/freezed_annotation.dart';


part 'image_event.freezed.dart';


@freezed
abstract class ImageEvent with _$ImageEvent {
  const factory ImageEvent.error(Exception e) = ImageEventError;
  const factory ImageEvent.loading() = ImageEventLoading;
  const factory ImageEvent.loaded() = ImageEventLoaded;
  const factory ImageEvent.onImageUploadSuccess() = ImageEventOnImageUploadSuccess;
}