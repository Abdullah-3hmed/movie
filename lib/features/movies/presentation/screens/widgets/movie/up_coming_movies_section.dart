import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/movies/cubit/movie/movie_cubit.dart';
import 'package:movie/features/movies/cubit/movie/movie_state.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/movie_page_view_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UpComingMoviesSection extends StatefulWidget {
  const UpComingMoviesSection({super.key});

  @override
  State<UpComingMoviesSection> createState() => _UpComingMoviesSectionState();
}

class _UpComingMoviesSectionState extends State<UpComingMoviesSection> {
  late final PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      buildWhen:
          (previous, current) =>
              previous.upComingMoviesState != current.upComingMoviesState,
      builder: (context, state) {
        switch (state.upComingMoviesState) {
          case RequestStatus.success:
            return Column(
              children: [
                SizedBox(
                  height: 360.0,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return MoviePageViewItem(
                        upComingMoviesModel: state.upComingMovies[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12.0),
                SmoothPageIndicator(
                  controller: controller,
                  count: 7,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: ColorsManager.primaryColor,
                    dotColor: Colors.white,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 5.0,
                  ),
                ),
              ],
            );
          case RequestStatus.error:
            return SizedBox(
              height: 360.0,
              child: Center(
                child: Text(
                  state.upComingErrorMessage,
                  style: Theme.of(context).textTheme.titleMedium,
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
