import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/cubit/actor/actor_cubit.dart';
import 'package:movie/features/movies/cubit/actor/actor_state.dart';
import 'package:movie/features/shared/presentation/screens/widgets/actor_details_biography.dart';

class ActorDetailsSection extends StatelessWidget {
  const ActorDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorCubit, ActorState>(
      buildWhen:
          (previous, current) => previous.actorState != current.actorState,
      builder: (context, state) {
        switch (state.actorDetailsState) {
          case RequestStatus.success:
            return Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(60.0),
                      ),
                      child: CustomCachedNetworkImage(
                        imageUrl: state.actorModel.image,
                        width: double.infinity,
                        height: 450.0,
                      ),
                    ),
                    const PositionedDirectional(
                      top: 60.0,
                      start: 16.0,
                      child: CustomBackButton(),
                    ),
                    PositionedDirectional(
                      bottom: 10.0,
                      start: 16.0,
                      child: Text(
                        state.actorModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 24.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            SolarSystemIcons.birthday,
                            size: 22.0,
                            color: ColorsManager.inActiveColor,
                          ),
                          Text(
                            "   ${state.actorModel.birthday}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(
                            SolarSystemIcons.location,
                            size: 22.0,
                            color: ColorsManager.inActiveColor,
                          ),
                          Expanded(
                            child: Text(
                              "   ${state.actorModel.placeOfBirth}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
                const CustomSectionTitle(
                  title: AppStrings.biography,
                  seeAll: false,
                ),
                const SizedBox(height: 8.0),
                ActorDetailsBiography(biography: state.actorModel.biography),
              ],
            );
          case RequestStatus.error:
            return SizedBox(
              height: 450.0,
              child: Center(
                child: Text(
                  state.actorErrorMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
