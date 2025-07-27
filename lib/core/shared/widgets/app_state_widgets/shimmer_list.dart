import 'package:flutter/material.dart';
import 'package:itunes_rss/core/shared/widgets/app_state_widgets/shimmer_listile.dart';

class ShimmerList extends StatelessWidget {
  final int itemCount;
  const ShimmerList({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ShimmerListTile(),
        );
      },
          childCount: itemCount),
    );
  }
}
