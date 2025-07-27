import 'package:flutter/material.dart';
import 'package:itunes_rss/core/shared/enums/view_state.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/features/top_albums/presentation/providers/top_albums_provider.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/abum_details/album_details_screen.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/top_albums/widgets/top_album_card.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/shared/widgets/app_state_widgets/loading/shimmer_listile.dart';


class TopAlbumsList extends StatefulWidget {
  final List<AlbumEntry> albums;

  const TopAlbumsList({super.key, required this.albums});

  @override
  State<TopAlbumsList> createState() => _TopAlbumsListState();
}

class _TopAlbumsListState extends State<TopAlbumsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.albums.isEmpty) {
      return const Center(child: Text('No Albums Found'));
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index == widget.albums.length - 1 &&
            context.watch<TopAlbumsProvider>().fetchMoreViewState ==
                ViewState.loading) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const ShimmerListTile(),
          );
        }
        return AlbumCard(
          album: widget.albums[index],
          onTap:
              /// Todo : Add routing Service and implement it
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          AlbumDetailsScreen(album: widget.albums[index]),
                ),
              ),
        );
      }, childCount: widget.albums.length),
    );
  }
}
