import 'package:flutter/material.dart';

import '/core/presentation/styles/app_colors.dart';
import '/l10n/l10n.dart';

///My header component
class MyHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: shrinkOffset == 0 ? Colors.transparent: AppColors.backgroundColor,
      child: Center(
        child: Text(
          context.l10n.rickAndMorty,
          style: const TextStyle(
            fontSize: 38,
            color: AppColors.secondaryColor,
            shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-1.5, -1.5),
                  color: AppColors.primaryColor),
              Shadow(
                // bottomRight
                offset: Offset(1.5, -1.5),
                color: AppColors.primaryColor,
              ),
              Shadow(
                // topRight
                offset: Offset(1.5, 1.5),
                color: AppColors.primaryColor,
              ),
              Shadow(
                // topLeft
                offset: Offset(-1.5, 1.5),
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 110;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
