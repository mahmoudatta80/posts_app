part of 'update_posts_bloc.dart';

@freezed
class UpdatePostsState with _$UpdatePostsState {
  const factory UpdatePostsState.initial() = _Initial;
  const factory UpdatePostsState.loading() = _Loading;
  const factory UpdatePostsState.success() = _Success;
  const factory UpdatePostsState.failure(String errorMessage) = _Failure;
}
