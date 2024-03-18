part of 'update_posts_bloc.dart';

@freezed
class UpdatePostsEvent with _$UpdatePostsEvent {
  const factory UpdatePostsEvent.started(PostEntity postEntity) = _Started;
}
