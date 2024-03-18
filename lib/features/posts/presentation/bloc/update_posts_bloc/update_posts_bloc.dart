import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/use_cases/update_posts_use_case.dart';

part 'update_posts_event.dart';

part 'update_posts_state.dart';

part 'update_posts_bloc.freezed.dart';

class UpdatePostsBloc extends Bloc<UpdatePostsEvent, UpdatePostsState> {
  final UpdatePostsUseCase updatePostsUseCase;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  bool updatePostIsLoading = false;

  UpdatePostsBloc(this.updatePostsUseCase)
      : super(const UpdatePostsState.initial()) {
    on<UpdatePostsEvent>((event, emit) async {
      emit(const UpdatePostsState.loading());
      updatePostIsLoading = true;

      Either<Failure, Unit> result =
          await updatePostsUseCase.call(event.postEntity);

      result.fold(
        (failure) => emit(UpdatePostsState.failure(failure.message)),
        (unit) => emit(const UpdatePostsState.success()),
      );
      updatePostIsLoading = false;
    });
  }
}
