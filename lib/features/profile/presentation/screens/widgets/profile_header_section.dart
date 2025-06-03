import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/icons/solar_system_icons.dart';
import 'package:movie/core/util/color_manager.dart';
import 'package:movie/core/widgets/custom_outline.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 24.0,
        vertical: 50.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOutline(
            height: 105.0,
            width: 105.0,
            strokeWidth: 4.0,
            radius: 50.0,
            onPressed: () {},
            gradient: const LinearGradient(
              colors: [
                ColorsManager.primaryColor,
                ColorsManager.secondaryColor,
              ],
            ),
            child: const CircleAvatar(
              radius: 50.0,
              backgroundImage: CachedNetworkImageProvider(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXxOGhzcdu7URxDFw3HDAE7mKacg-Z4kA2WA&s",
              ),
            ),
          ),
          Column(
            spacing: 5.0,
            children: [
              Text(
                "Abdullah Ahmed",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "@Rtx_3050",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.inActiveColor,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(SolarSystemIcons.sign_out, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
