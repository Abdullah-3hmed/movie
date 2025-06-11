import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/local/cache_helper.dart';
import 'package:movie/core/services/service_locator.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/core/widgets/custom_outline.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 24.0,
        vertical: 50.0,
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen:
            (previous, current) =>
                previous.profileState != current.profileState,
        builder: (context, state) {
          switch (state.profileState) {
            case RequestStatus.success:
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOutline(
                    height: 103.0,
                    width: 103.0,
                    strokeWidth: 2.0,
                    radius: 50.0,
                    onPressed: () {},
                    gradient: const LinearGradient(
                      colors: [
                        ColorsManager.primaryColor,
                        ColorsManager.secondaryColor,
                      ],
                    ),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CustomCachedNetworkImage(
                        imageUrl: state.profileModel.avatarPath,
                        height: 100.0,
                        width: 100.0,
                      ),
                    ),
                  ),
                  Column(
                    spacing: 5.0,
                    children: [
                      Text(
                        state.profileModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        state.profileModel.userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.inActiveColor,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      context.replaceRoute(const AuthRoute());
                      AppConstants.sessionId = "";
                      await getIt<CacheHelper>().delete(
                        key: AppConstants.sessionIdKey,
                      );
                    },
                    icon: const Icon(
                      SolarSystemIcons.sign_out,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            case RequestStatus.error:
              return SizedBox(
                height: 100.0,
                child: Center(
                  child: Text(
                    state.profileErrorMessage,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
