import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/movies/data/movies_model.dart';
import 'package:movie/features/shared/data/actor_model.dart';

class ActorState extends Equatable {
  final RequestStatus actorState;
  final ActorModel actorModel;
  final String actorErrorMessage;
  final RequestStatus actorMoviesState;
  final List<MoviesModel> actorMovies;
  final String actorMoviesErrorMessage;
  final RequestStatus actorDetailsState;
  final String actorDetailsErrorMessage;
  final bool isConnected;

  const ActorState({
    this.actorState = RequestStatus.loading,
    this.actorModel = ActorModel.empty,
    this.actorErrorMessage = "",
    this.actorMoviesState = RequestStatus.loading,
    this.actorMovies = const [],
    this.actorMoviesErrorMessage = "",
    this.actorDetailsState = RequestStatus.initial,
    this.actorDetailsErrorMessage = "",
    this.isConnected = true,
  });

  ActorState copyWith({
    RequestStatus? actorState,
    ActorModel? actorModel,
    String? actorErrorMessage,
    RequestStatus? actorMoviesState,
    List<MoviesModel>? actorMovies,
    String? actorMoviesErrorMessage,
    String? actorDetailsErrorMessage,
    RequestStatus? actorDetailsState,
    bool? isConnected,
  }) => ActorState(
    actorState: actorState ?? this.actorState,
    actorModel: actorModel ?? this.actorModel,
    actorErrorMessage: actorErrorMessage ?? this.actorErrorMessage,
    actorMoviesState: actorMoviesState ?? this.actorMoviesState,
    actorMovies: actorMovies ?? this.actorMovies,
    actorMoviesErrorMessage:
        actorMoviesErrorMessage ?? this.actorMoviesErrorMessage,
    actorDetailsErrorMessage:
        actorDetailsErrorMessage ?? this.actorDetailsErrorMessage,
    actorDetailsState: actorDetailsState ?? this.actorDetailsState,
    isConnected: isConnected ?? this.isConnected,
  );

  @override
  List<Object> get props => [
    actorState,
    actorModel,
    actorErrorMessage,
    actorMoviesState,
    actorMovies,
    actorMoviesErrorMessage,
    actorDetailsErrorMessage,
    actorDetailsState,
    isConnected,
  ];
}
