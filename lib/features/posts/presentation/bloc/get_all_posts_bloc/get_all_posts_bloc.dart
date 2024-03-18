import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/use_cases/get_all_posts_use_case.dart';

part 'get_all_posts_event.dart';

part 'get_all_posts_state.dart';

part 'get_all_posts_bloc.freezed.dart';

class GetAllPostsBloc extends Bloc<GetAllPostsEvent, GetAllPostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;

  GetAllPostsBloc(this.getAllPostsUseCase)
      : super(const GetAllPostsState.initial()) {
    on<GetAllPostsEvent>((event, emit) async {
      emit(const GetAllPostsState.loading());

      Either<Failure, List<PostEntity>> result =
          await getAllPostsUseCase.call();

      result.fold(
        (failure) => emit(GetAllPostsState.failure(failure.message)),
        (posts) => emit(GetAllPostsState.success(posts)),
      );
    });
  }
}
