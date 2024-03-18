part of 'get_all_posts_bloc.dart';

@freezed
class GetAllPostsEvent with _$GetAllPostsEvent {
  const factory GetAllPostsEvent.started() = _Started;
  const factory GetAllPostsEvent.refresh() = _Refresh;
}
