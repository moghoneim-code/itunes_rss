import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[700]!,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF2E2E2E),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: double.infinity,
                  color: const Color(0xFF2E2E2E),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 14,
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: const Color(0xFF2E2E2E),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
