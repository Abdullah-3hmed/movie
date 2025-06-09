import 'package:equatable/equatable.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/profile/data/profile_model.dart';

class ProfileState extends Equatable {
  final RequestStatus profileState;
  final String profileErrorMessage;
  final ProfileModel profileModel;
  const ProfileState({
    this.profileState = RequestStatus.initial,
    this.profileErrorMessage = '',
    this.profileModel = ProfileModel.empty,
  });
  ProfileState copyWith({
    RequestStatus? profileState,
    String? profileErrorMessage,
    ProfileModel? profileModel,
  }) {
    return ProfileState(
      profileState: profileState ?? this.profileState,
      profileErrorMessage: profileErrorMessage ?? this.profileErrorMessage,
      profileModel: profileModel ?? this.profileModel,
    );
  }

  @override
  List<Object> get props => [profileState, profileErrorMessage, profileModel];
}
