class FavoriteAlbumModel{

  final String name ;
  final String id;


  FavoriteAlbumModel({
    required this.name,
    required this.id,
  });


  factory FavoriteAlbumModel.fromJson(Map<String, dynamic> json) {
    return FavoriteAlbumModel(
      name: json['name'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }



}