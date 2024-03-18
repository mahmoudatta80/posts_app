part of 'delete_posts_bloc.dart';

@freezed
class DeletePostsEvent with _$DeletePostsEvent {
  const factory DeletePostsEvent.started(int id) = _Started;
}
