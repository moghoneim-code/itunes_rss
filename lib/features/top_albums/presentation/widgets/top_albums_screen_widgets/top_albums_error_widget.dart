import 'package:flutter/material.dart';
import 'package:itunes_rss/features/top_albums/presentation/providers/top_albums_provider.dart';
import 'package:provider/provider.dart';


class TopAlbumsErrorWidget extends StatelessWidget {
  const TopAlbumsErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TopAlbumsProvider>(builder: (context, provider, child) {
      return SliverToBoxAdapter(
        child: Column(
          children: [

            const Icon(Icons.error, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              provider.error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),
            IconButton(onPressed: () => provider.getTopAlbumsFromNetwork(),
              icon: const Icon(Icons.refresh, size: 30, color: Colors.white),
            ),

          ],
        ),
      );
    });
  }
}
