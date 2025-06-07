import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_section_title.dart';
import 'package:movie/features/movies/cubit/movie_details_cubit.dart';
import 'package:movie/features/movies/cubit/movie_details_state.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/presentation/screens/widgets/cast_list_view_item.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key, required this.cast});

  final List<CastModel> cast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionTitle(
          title: AppStrings.cast,
          onPressed: () {
            //  context.pushRoute(CastRoute(cast: cast));
          },
        ),
        BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          buildWhen:
              (previous, current) => previous.castState != current.castState,
          builder: (context, state) {
            switch (state.castState) {
              case RequestStatus.loading:
                return const SizedBox.shrink();
              case RequestStatus.success:
                return SizedBox(
                  height: 200.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: AppConstants.horizontalPadding,
                    ),
                    itemBuilder:
                        (context, index) =>
                            CastListViewItem(castModel: cast[index]),
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 8.0),
                    itemCount: cast.length,
                  ),
                );
              case RequestStatus.error:
                return SizedBox(
                  height: 200.0,
                  child: Center(
                    child: Text(
                      state.castErrorMessage,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
