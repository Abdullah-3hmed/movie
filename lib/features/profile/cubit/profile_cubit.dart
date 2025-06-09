import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';
import 'package:movie/features/profile/repos/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(const ProfileState());
  final ProfileRepo profileRepo;

  Future<void> getProfile() async {
    final result = await profileRepo.getProfile();
    result.fold(
      (failure) {
        emit(state.copyWith(profileState: RequestStatus.error));
      },
      (profile) {
        emit(
          state.copyWith(
            profileState: RequestStatus.success,
            profileModel: profile,
          ),
        );
      },
    );
  }
}
