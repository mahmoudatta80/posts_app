import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:posts_app/features/posts/domain/use_cases/delete_posts_use_case.dart';

part 'delete_posts_event.dart';

part 'delete_posts_state.dart';

part 'delete_posts_bloc.freezed.dart';

class DeletePostsBloc extends Bloc<DeletePostsEvent, DeletePostsState> {
  final DeletePostsUseCase deletePostsUseCase;
  bool deletePostIsLoading = false;

  DeletePostsBloc(this.deletePostsUseCase)
      : super(const DeletePostsState.initial()) {
    on<DeletePostsEvent>((event, emit) async {
      emit(const DeletePostsState.loading());
      deletePostIsLoading = true;

      var result = await deletePostsUseCase.call(event.id);

      result.fold(
        (failure) => emit(DeletePostsState.failure(failure.message)),
        (unit) => emit(const DeletePostsState.success()),
      );
      deletePostIsLoading = false;
    });
  }
}
