part of 'add_posts_bloc.dart';

@freezed
class AddPostsEvent with _$AddPostsEvent {
  const factory AddPostsEvent.started(PostEntity postEntity) = _Started;
}
