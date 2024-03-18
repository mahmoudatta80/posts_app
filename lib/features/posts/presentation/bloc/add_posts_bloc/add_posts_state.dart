part of 'add_posts_bloc.dart';

@freezed
class AddPostsState with _$AddPostsState {
  const factory AddPostsState.initial() = _Initial;
  const factory AddPostsState.loading() = _Loading;
  const factory AddPostsState.success() = _Success;
  const factory AddPostsState.failure(String errorMessage) = _Failure;
}
