part of 'delete_posts_bloc.dart';

@freezed
class DeletePostsState with _$DeletePostsState {
  const factory DeletePostsState.initial() = _Initial;
  const factory DeletePostsState.loading() = _Loading;
  const factory DeletePostsState.success() = _Success;
  const factory DeletePostsState.failure(String errorMessage) = _Failure;
}
