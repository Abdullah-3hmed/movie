import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/util/app_constants.dart';
import 'package:movie/core/util/app_strings.dart';
import 'package:movie/core/widgets/custom_back_button.dart';
import 'package:movie/core/widgets/custom_scaffold.dart';
import 'package:movie/features/shared/data/cast_model.dart';
import 'package:movie/features/shared/presentation/screens/widgets/see_all_cast_list_item.dart';

@RoutePage()
class SeeAllCastScreen extends StatelessWidget {
  const SeeAllCastScreen({super.key, required this.cast});
  final List<CastModel> cast;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppConstants.horizontalPadding,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const CustomBackButton(),
                  const SizedBox(width: 16.0),
                  Text(
                    AppStrings.allCast,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder:
                      (context, index) =>
                          SeeAllCastListItem(castModel: cast[index]),
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 16.0),
                  itemCount: cast.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
