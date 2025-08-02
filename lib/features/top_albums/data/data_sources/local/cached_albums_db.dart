import 'dart:developer';

import 'package:itunes_rss/features/top_albums/data/models/favorite_album.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CachedFavoriteAlbumsDatabase {


  CachedFavoriteAlbumsDatabase._privateConstructor();

  static final CachedFavoriteAlbumsDatabase instance =
      CachedFavoriteAlbumsDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'cached_albums.db'),
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE cached_albums(
          id TEXT PRIMARY KEY,
          name TEXT
          )
        ''');

  }

  Future<void> printDatabase() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cached_albums');
    log('Cached Albums: ${maps.map((e) => e.toString()).join(', ')}',
        name: 'CachedFavoriteAlbumsDatabase.printDatabase');
  }

  Future<int?> insertAlbum(FavoriteAlbumModel favoriteAlbum) async {
    final db = await database;
    log(
      'Inserting album: ${favoriteAlbum.toJson()}',
      name: 'CachedFavoriteAlbumsDatabase.insertAlbum',
    );

    final result = await db.insert(
      'cached_albums',
      favoriteAlbum.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  Future<bool> isTheAlbumFavorite(String id) async {
    final db = await database;

    final result = await db
        .query('cached_albums', where: 'id = ?', whereArgs: [id]);

    if (result.isEmpty) {
      log(
        'Album with id $id is not favorite',
        name: 'CachedFavoriteAlbumsDatabase.isTheAlbumFavorite',
      );
      return false;
    } else {
      log(
        'Album with id $id is favorite',
        name: 'CachedFavoriteAlbumsDatabase.isTheAlbumFavorite',
      );
      return true;
    }
  }


  Future<void> removeAlbumFromFavorites(FavoriteAlbumModel album) async {
    final db = await database;
    await db.delete(
      'cached_albums',
      where: 'id = ?',
      whereArgs: [album.id],
    );
  }

}
