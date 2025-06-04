import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/movies/cubit/movie_cubit.dart';
import 'package:movie/features/movies/cubit/movie_state.dart';
import 'package:movie/features/movies/presentation/screens/widgets/movie/movie_now_playing_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NowPlayingMoviesSection extends StatefulWidget {
  const NowPlayingMoviesSection({super.key});

  @override
  State<NowPlayingMoviesSection> createState() =>
      _NowPlayingMoviesSectionState();
}

class _NowPlayingMoviesSectionState extends State<NowPlayingMoviesSection> {
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
              previous.nowPlayingMoviesState != current.nowPlayingMoviesState,
      builder: (context, state) {
        return state.nowPlayingMoviesState == RequestStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
              children: [
                SizedBox(
                  height: 360.0,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: state.nowPlayingMovies.length,
                    itemBuilder: (context, index) {
                      return MovieNowPlayingItem(
                        movieNowPlayingModel: state.nowPlayingMovies[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12.0),
                SmoothPageIndicator(
                  controller: controller,
                  count: state.nowPlayingMovies.length,
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
      },
    );
  }
}
