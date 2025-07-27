import 'package:flutter/material.dart';
import 'package:itunes_rss/features/top_albums/presentation/providers/top_albums_provider.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/top_albums/widgets/top_albums_body.dart';
import 'package:provider/provider.dart';


class TopAlbumsScreen extends StatefulWidget {
  const TopAlbumsScreen({super.key});

  @override
  State<TopAlbumsScreen> createState() => _TopAlbumsScreenState();
}

class _TopAlbumsScreenState extends State<TopAlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TopAlbumsProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: null,
          body: TopAlbumsBody(),
        );
      },
    );
  }
}
