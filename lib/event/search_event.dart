


import 'package:freezed_annotation/freezed_annotation.dart';


part 'search_event.freezed.dart';


@freezed
abstract class SearchEvent with _$SearchEvent {
  const factory SearchEvent.error(String message) = SearchEventError;
  const factory SearchEvent.loading() = SearchEventLoading;
  const factory SearchEvent.loaded() = SearchEventLoaded;
}