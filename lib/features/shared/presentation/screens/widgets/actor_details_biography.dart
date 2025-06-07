import 'package:flutter/material.dart';
import 'package:movie/core/util/color_manager.dart';

class ActorDetailsBiography extends StatefulWidget {
  const ActorDetailsBiography({super.key, required this.biography});
  final String biography;
  @override
  State<ActorDetailsBiography> createState() => _ActorDetailsBiographyState();
}

class _ActorDetailsBiographyState extends State<ActorDetailsBiography> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodyLarge!.copyWith(
      color: Colors.white.withValues(alpha: 0.6),
      fontWeight: FontWeight.w400,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedCrossFade(
            firstChild: Text(
              widget.biography,
              style: textTheme,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            secondChild: Text(widget.biography, style: textTheme),
            crossFadeState:
                _isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
          const SizedBox(height: 8),
          Align(
            child: Container(
              decoration:
                  _isExpanded
                      ? BoxDecoration(
                        border: Border.all(color: ColorsManager.primaryColor),
                        borderRadius: BorderRadius.circular(40.0),
                      )
                      : null,
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: Icon(
                  _isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                  color: ColorsManager.primaryColor,
                ),
                label: Text(
                  _isExpanded ? 'Read less' : 'Read More',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
