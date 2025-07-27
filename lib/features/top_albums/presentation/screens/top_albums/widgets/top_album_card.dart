import 'package:flutter/material.dart';
import 'package:itunes_rss/core/shared/widgets/image_widgets/cached_network_image_widget.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';

class AlbumCard extends StatelessWidget {
  final AlbumEntry album;
  final void Function()? onTap;
  const AlbumCard({super.key, required this.album, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: _buildCachedImage(),
        title: _buildTitle(),
        subtitle: _buildArtistName(),
        trailing: _buildPriceTag(),
        onTap:  onTap ,
      ),
    );
  }

  Widget _buildCachedImage() => Hero(
    tag: album.id.label,
    transitionOnUserGestures: true,
    child: CachedNetworkImageWidget(
      height: 75,
      width: 60,
      isRounded: false,
      isElevated: false,
      imageUrl:album.imImage.first.label,
    ),
  );

  Widget _buildTitle() => Text(
    album.imName.label,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  );

  Widget _buildPriceTag() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blueAccent, width: 1.5),
    ),
    child: Text(
      album.imPrice.label,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _buildArtistName() => Text(
    album.imArtist.label,
    style: const TextStyle(fontSize: 14, color: Colors.grey),
  );
}
