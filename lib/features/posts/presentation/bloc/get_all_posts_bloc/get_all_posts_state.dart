part of 'get_all_posts_bloc.dart';

@freezed
class GetAllPostsState with _$GetAllPostsState {
  const factory GetAllPostsState.initial() = _Initial;
  const factory GetAllPostsState.loading() = _Loading;
  const factory GetAllPostsState.success(List<PostEntity> posts) = _Success;
  const factory GetAllPostsState.failure(String errorMessage) = _Failure;
}
