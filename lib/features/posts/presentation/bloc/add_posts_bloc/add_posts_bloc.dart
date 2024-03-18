import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:posts_app/core/error/failure.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/use_cases/add_posts_use_case.dart';

part 'add_posts_event.dart';

part 'add_posts_state.dart';

part 'add_posts_bloc.freezed.dart';

class AddPostsBloc extends Bloc<AddPostsEvent, AddPostsState> {
  final AddPostsUseCase addPostsUseCase;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  bool addPostIsLoading = false;

  AddPostsBloc(this.addPostsUseCase) : super(const AddPostsState.initial()) {
    on<AddPostsEvent>((event, emit) async {
      emit(const AddPostsState.loading());
      addPostIsLoading = true;

      Either<Failure, Unit> result =
          await addPostsUseCase.call(event.postEntity);

      result.fold(
        (failure) => emit(AddPostsState.failure(failure.message)),
        (unit) => emit(const AddPostsState.success()),
      );
      addPostIsLoading = false;
    });
  }
}
