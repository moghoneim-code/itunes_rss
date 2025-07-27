import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:itunes_rss/core/shared/widgets/image_widgets/cached_network_image_widget.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AlbumDetailsBody extends StatelessWidget {
  final AlbumEntry album;

  const AlbumDetailsBody({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(size),
          const SizedBox(height: 24),
          Text(
            album.imName.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            album.imArtist.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Released on: ${album.imReleaseDate.attributes.label}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Genre: ${album.category.attributes.label}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          _buildOpenButton(context, album.id.label),
        ],
      ),
    );
  }

  Widget _buildImage(Size size) => Hero(
    tag: album.id.label,
    transitionOnUserGestures: true,
    child: CachedNetworkImageWidget(
      height: size.width * 0.7,
      width: size.width * 0.7,
      isRounded: true,
      isElevated: false,
      imageUrl: album.imImage.last.label,
    ),
  );

  Widget _buildOpenButton(BuildContext context, String url) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[850],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () async {
          final uri = Uri.tryParse(url);
          if (uri != null && await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            log('Could not launch $url');
          }
        },
        child: const Text(
          'Open in iTunes',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
