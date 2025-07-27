import 'package:flutter/material.dart';

AppBar albumDetailsAppBar(BuildContext context){
  return AppBar(
    title: const Text('Album Details'),
    centerTitle: true,
    backgroundColor: Colors.black87,
    elevation: 0,
    leading:  IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: ()=> Navigator.pop(context),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.share),
        onPressed: () {
        },
      ),
      IconButton(
        icon: const Icon(Icons.favorite_border),
        onPressed: () {
        },
      ),
    ],
  );

}