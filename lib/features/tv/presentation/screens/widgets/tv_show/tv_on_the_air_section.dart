import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_cubit.dart';
import 'package:movie/features/tv/cubit/tv_cubit/tv_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/tv_page_view_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TvOnTheAirSection extends StatefulWidget {
  const TvOnTheAirSection({super.key});

  @override
  State<TvOnTheAirSection> createState() => _TvOnTheAirSectionState();
}

class _TvOnTheAirSectionState extends State<TvOnTheAirSection> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvState>(
      buildWhen:
          (previous, current) =>
              previous.tvOnTheAirState != current.tvOnTheAirState,
      builder: (context, state) {
        switch (state.tvOnTheAirState) {
          case RequestStatus.success:
            return Column(
              children: [
                SizedBox(
                  height: 385.0,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 7,
                    itemBuilder:
                        (BuildContext context, int index) => TvPageViewItem(
                          tvModel: state.tvOnTheAirShows[index],
                        ),
                  ),
                ),
                const SizedBox(height: 12.0),
                SmoothPageIndicator(
                  controller: _pageController,
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
              height: 385.0,
              child: Center(
                child: Text(
                  state.tvOnTheAirErrorMessage,
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
