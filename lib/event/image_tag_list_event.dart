

import 'package:freezed_annotation/freezed_annotation.dart';


part 'image_tag_list_event.freezed.dart';


@freezed
abstract class ImageTagListEvent with _$ImageTagListEvent {

  const factory ImageTagListEvent.error(String message) = ImageTagListEventError;
}