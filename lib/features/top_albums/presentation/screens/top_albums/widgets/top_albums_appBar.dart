import 'package:flutter/material.dart';

SliverAppBar topAlbumsAppBar(BuildContext context){
  return SliverAppBar(
    pinned: false,
    floating: true,
    snap: true,
    expandedHeight: 100,
    backgroundColor: Colors.black,
    flexibleSpace: const FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(left: 16, bottom: 16),
      title: Text(
        'Top Albums',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}