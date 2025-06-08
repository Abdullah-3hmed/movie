import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/config/router/app_router.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/assets_manager.dart';
import 'package:movie/core/util/show_toast.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_cached_network_image.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_cubit.dart';
import 'package:movie/features/tv/cubit/tv_details_cubit/tv_details_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_details/tv_details_clipper.dart';

class TvDetailsPoster extends StatelessWidget {
  const TvDetailsPoster({
    super.key,
    required this.posterUrl,
    required this.videoId,
  });

  final String posterUrl;
  final int videoId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCubic,
          height: 330.0,
          width: double.infinity,
          child: ClipPath(
            clipper: TvDetailsClipper(),
            child: CustomCachedNetworkImage(
              imageUrl: posterUrl,
              height: 330.0,
              width: double.infinity,
            ),
          ),
        ),
        const PositionedDirectional(
          top: 40.0,
          start: 16.0,
          child: CustomBackButton(),
        ),
        PositionedDirectional(
          start: 0.0,
          end: 0.0,
          bottom: 10.0,
          child: BlocListener<TvDetailsCubit, TvDetailsState>(
            listenWhen:
                (previous, current) =>
                    previous.trailerState != current.trailerState,
            listener: (context, state) {
              if (state.trailerState == RequestStatus.error) {
                showToast(
                  message: state.trailerErrorMessage,
                  state: ToastStates.error,
                );
              }
            },
            child: GestureDetector(
              onTap: () async {
                String videoUrl = await context
                    .read<TvDetailsCubit>()
                    .getTrailer(videoId: videoId);
                if (videoUrl.isNotEmpty && (context.mounted)) {
                  context.pushRoute(TrailerRoute(videoId: videoUrl));
                }
              },
              child: SizedBox(
                height: 60.0,
                width: 60.0,
                child: SvgPicture.asset(AssetsManager.neonPlayButton),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
