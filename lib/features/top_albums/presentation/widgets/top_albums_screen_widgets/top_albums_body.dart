import 'package:flutter/material.dart';
import 'package:itunes_rss/core/shared/enums/view_state.dart';
import 'package:itunes_rss/features/top_albums/presentation/providers/top_albums_provider.dart';
import 'package:itunes_rss/features/top_albums/presentation/widgets/top_albums_screen_widgets/top_albums_appBar.dart';
import 'package:itunes_rss/features/top_albums/presentation/widgets/top_albums_screen_widgets/top_albums_error_widget.dart';
import 'package:itunes_rss/features/top_albums/presentation/widgets/top_albums_screen_widgets/top_albums_list.dart';
import 'package:provider/provider.dart';
import '../../../../../core/shared/widgets/app_state_widgets/shimmer_list.dart';

class TopAlbumsBody extends StatefulWidget {
  const TopAlbumsBody({super.key});

  @override
  State<TopAlbumsBody> createState() => _TopAlbumsBodyState();
}

class _TopAlbumsBodyState extends State<TopAlbumsBody> {
  @override
  void initState() {

    final controller = context.read<TopAlbumsProvider>().scrollController;

    controller.addListener(() {
      final provider = context.read<TopAlbumsProvider>();
      final threshold = 300.0;
      final position = controller.position;

      if (position.pixels >= position.maxScrollExtent - threshold &&
          provider.hasMoreData &&
          provider.fetchMoreViewState != ViewState.loading) {
        provider.fetchMoreAlbums();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TopAlbumsProvider>(
      builder: (context, provider, child) {
        return CustomScrollView(
          controller: provider.scrollController,
          slivers: [
            topAlbumsAppBar(context),
            switch (provider.viewState) {
              ViewState.initial => _buildSliverCenteredText(
                'Welcome to Top Albums',
              ),
              ViewState.loading => ShimmerList(itemCount: 10,),
              ViewState.loaded => TopAlbumsList(albums: provider.albums),
              ViewState.error => TopAlbumsErrorWidget(),
            },
          ],
        );
      },
    );
  }




  SliverToBoxAdapter _buildSliverCenteredText(String message) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  
}
