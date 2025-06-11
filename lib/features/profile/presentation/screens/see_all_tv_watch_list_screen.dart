import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/enums/request_status.dart';
import 'package:movie/core/util/show_toast.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/profile/cubit/profile_cubit.dart';
import 'package:movie/features/profile/cubit/profile_state.dart';
import 'package:movie/features/tv/presentation/screens/widgets/tv_show/see_all_tv_shows_list_item.dart';

@RoutePage()
class SeeAllTvWatchlistScreen extends StatelessWidget {
  const SeeAllTvWatchlistScreen({
    super.key,
    required this.title,
    this.isWatchList = false,
  });

  final String title;
  final bool isWatchList;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(width: 16.0),
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
              const SizedBox(height: 24.0),
              BlocConsumer<ProfileCubit, ProfileState>(
                listenWhen:
                    (previous, current) =>
                        previous.addAndRemoveWatchlistState !=
                        current.addAndRemoveWatchlistState,
                listener: (context, state) {
                  if (state.addAndRemoveWatchlistState == RequestStatus.error) {
                    showToast(
                      message: state.addAndRemoveWatchlistErrorMessage,
                      state: ToastStates.error,
                    );
                  }
                },
                buildWhen:
                    (previous, current) =>
                        previous.inTvWatchlist != current.inTvWatchlist &&
                        isWatchList,
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder:
                          (context, index) => SeeAllTvShowsListItem(
                            tvModel: state.tvWatchlist[index],
                            isWatchList: isWatchList,
                          ),
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 16.0),
                      itemCount: state.tvWatchlist.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
