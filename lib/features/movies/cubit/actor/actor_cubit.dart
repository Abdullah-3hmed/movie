import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/cubit/actor/actor_state.dart';
import 'package:movie/features/movies/repos/actor/actor_repo.dart';

class ActorCubit extends Cubit<ActorState> {
  ActorCubit({required this.actorRepo}) : super(const ActorState());
  final ActorRepo actorRepo;

  Future<void> getActorDetails({required int actorId}) async {
    final result = await actorRepo.getActorDetails(actorId: actorId);
    result.fold(
      (failure) {
        if (!failure.isConnected) {
          emit(
            state.copyWith(
              actorState: RequestStatus.error,
              actorErrorMessage: failure.errorMessage,
              isConnected: false,
            ),
          );
        } else {
          emit(
            state.copyWith(
              actorState: RequestStatus.error,
              actorErrorMessage: failure.errorMessage,
            ),
          );
        }
      },
      (actorModel) => emit(
        state.copyWith(
          actorState: RequestStatus.success,
          actorModel: actorModel,
        ),
      ),
    );
  }

  Future<void> getActorMovies({required int actorId}) async {
    final result = await actorRepo.getActorMovies(actorId: actorId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          actorMoviesState: RequestStatus.error,
          actorMoviesErrorMessage: failure.errorMessage,
        ),
      ),
      (actorMovies) => emit(
        state.copyWith(
          actorMoviesState: RequestStatus.success,
          actorMovies: actorMovies,
        ),
      ),
    );
  }

  Future<void> getActorDetailsAndMovies({required int actorId}) async {
    emit(
      state.copyWith(
        actorDetailsState: RequestStatus.loading,
        isConnected: true,
      ),
    );
    await Future.wait([
      getActorDetails(actorId: actorId),
      getActorMovies(actorId: actorId),
    ]);
    if (!state.isConnected) {
      emit(
        state.copyWith(
          actorDetailsState: RequestStatus.error,
          actorDetailsErrorMessage: state.actorErrorMessage,
        ),
      );
    } else {
      emit(state.copyWith(actorDetailsState: RequestStatus.success));
    }
  }
}
