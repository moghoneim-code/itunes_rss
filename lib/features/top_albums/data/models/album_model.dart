class AlbumFeed {
  Author author;
  List<AlbumEntry> entry;
  AlbumIcon updated;
  AlbumIcon rights;
  AlbumIcon title;
  AlbumIcon icon;
  List<Link> link;
  AlbumIcon id;

  AlbumFeed({
    required this.author,
    required this.entry,
    required this.updated,
    required this.rights,
    required this.title,
    required this.icon,
    required this.link,
    required this.id,
  });

  factory AlbumFeed.fromJson(Map<String, dynamic> json) => AlbumFeed(
    author: Author.fromJson(json["author"]),
    entry: List<AlbumEntry>.from(
      json["entry"].map((x) => AlbumEntry.fromJson(x)),
    ),
    updated: AlbumIcon.fromJson(json["updated"]),
    rights: AlbumIcon.fromJson(json["rights"]),
    title: AlbumIcon.fromJson(json["title"]),
    icon: AlbumIcon.fromJson(json["icon"]),
    link: List<Link>.from(json["link"].map((x) => Link.fromJson(x))),
    id: AlbumIcon.fromJson(json["id"]),
  );

  Map<String, dynamic> toJson() => {
    "author": author.toJson(),
    "entry": List<dynamic>.from(entry.map((x) => x.toJson())),
    "updated": updated.toJson(),
    "rights": rights.toJson(),
    "title": title.toJson(),
    "icon": icon.toJson(),
    "link": List<dynamic>.from(link.map((x) => x.toJson())),
    "id": id.toJson(),
  };
}

class Author {
  AlbumIcon name;
  AlbumIcon uri;

  Author({required this.name, required this.uri});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: AlbumIcon.fromJson(json["name"]),
    uri: AlbumIcon.fromJson(json["uri"]),
  );

  Map<String, dynamic> toJson() => {"name": name.toJson(), "uri": uri.toJson()};
}

class AlbumIcon {
  String label;

  AlbumIcon({required this.label});

  factory AlbumIcon.fromJson(Map<String, dynamic> json) =>
      AlbumIcon(label: json["label"]);

  Map<String, dynamic> toJson() => {"label": label};
}

class AlbumEntry {
  AlbumIcon imName;
  List<ImImage> imImage;
  AlbumIcon imItemCount;
  ImPrice imPrice;
  EntryImContentType imContentType;
  AlbumIcon rights;
  AlbumIcon title;
  Link link;
  Id id;
  ImArtist imArtist;
  Category category;
  ImReleaseDate imReleaseDate;

  AlbumEntry({
    required this.imName,
    required this.imImage,
    required this.imItemCount,
    required this.imPrice,
    required this.imContentType,
    required this.rights,
    required this.title,
    required this.link,
    required this.id,
    required this.imArtist,
    required this.category,
    required this.imReleaseDate,
  });

  factory AlbumEntry.fromJson(Map<String, dynamic> json) => AlbumEntry(
    imName: AlbumIcon.fromJson(json["im:name"]),
    imImage: List<ImImage>.from(
      json["im:image"].map((x) => ImImage.fromJson(x)),
    ),
    imItemCount: AlbumIcon.fromJson(json["im:itemCount"]),
    imPrice: ImPrice.fromJson(json["im:price"]),
    imContentType: EntryImContentType.fromJson(json["im:contentType"]),
    rights: AlbumIcon.fromJson(json["rights"]),
    title: AlbumIcon.fromJson(json["title"]),
    link: Link.fromJson(json["link"]),
    id: Id.fromJson(json["id"]),
    imArtist: ImArtist.fromJson(json["im:artist"]),
    category: Category.fromJson(json["category"]),
    imReleaseDate: ImReleaseDate.fromJson(json["im:releaseDate"]),
  );

  Map<String, dynamic> toJson() => {
    "im:name": imName.toJson(),
    "im:image": List<dynamic>.from(imImage.map((x) => x.toJson())),
    "im:itemCount": imItemCount.toJson(),
    "im:price": imPrice.toJson(),
    "im:contentType": imContentType.toJson(),
    "rights": rights.toJson(),
    "title": title.toJson(),
    "link": link.toJson(),
    "id": id.toJson(),
    "im:artist": imArtist.toJson(),
    "category": category.toJson(),
    "im:releaseDate": imReleaseDate.toJson(),
  };
}

class Category {
  CategoryAttributes attributes;

  Category({required this.attributes});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(attributes: CategoryAttributes.fromJson(json["attributes"]));

  Map<String, dynamic> toJson() => {"attributes": attributes.toJson()};
}

class CategoryAttributes {
  String imId;
  String term;
  String scheme;
  String label;

  CategoryAttributes({
    required this.imId,
    required this.term,
    required this.scheme,
    required this.label,
  });

  factory CategoryAttributes.fromJson(Map<String, dynamic> json) =>
      CategoryAttributes(
        imId: json["im:id"],
        term: json["term"],
        scheme: json["scheme"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
    "im:id": imId,
    "term": term,
    "scheme": scheme,
    "label": label,
  };
}

class Id {
  String label;
  IdAttributes attributes;

  Id({required this.label, required this.attributes});

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    label: json["label"],
    attributes: IdAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "attributes": attributes.toJson(),
  };
}

class IdAttributes {
  String imId;

  IdAttributes({required this.imId});

  factory IdAttributes.fromJson(Map<String, dynamic> json) =>
      IdAttributes(imId: json["im:id"]);

  Map<String, dynamic> toJson() => {"im:id": imId};
}

class ImArtist {
  String label;
  ImArtistAttributes attributes;

  ImArtist({required this.label, required this.attributes});

  factory ImArtist.fromJson(Map<String, dynamic> json) => ImArtist(
    label: json["label"],
    attributes: ImArtistAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "attributes": attributes.toJson(),
  };
}

class ImArtistAttributes {
  String href;

  ImArtistAttributes({required this.href});

  factory ImArtistAttributes.fromJson(Map<String, dynamic> json) =>
      ImArtistAttributes(href: json["href"]);

  Map<String, dynamic> toJson() => {"href": href};
}

class EntryImContentType {
  ImContentTypeImContentType imContentType;
  ImContentTypeAttributes attributes;

  EntryImContentType({required this.imContentType, required this.attributes});

  factory EntryImContentType.fromJson(Map<String, dynamic> json) =>
      EntryImContentType(
        imContentType: ImContentTypeImContentType.fromJson(
          json["im:contentType"],
        ),
        attributes: ImContentTypeAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
    "im:contentType": imContentType.toJson(),
    "attributes": attributes.toJson(),
  };
}

class ImContentTypeAttributes {
  Label term;
  Label label;

  ImContentTypeAttributes({required this.term, required this.label});

  factory ImContentTypeAttributes.fromJson(Map<String, dynamic> json) =>
      ImContentTypeAttributes(
        term: labelValues.map[json["term"]]!,
        label: labelValues.map[json["label"]]!,
      );

  Map<String, dynamic> toJson() => {
    "term": labelValues.reverse[term],
    "label": labelValues.reverse[label],
  };
}

enum Label { ALBUM, MUSIC }

final labelValues = EnumValues({"Album": Label.ALBUM, "Music": Label.MUSIC});

class ImContentTypeImContentType {
  ImContentTypeAttributes attributes;

  ImContentTypeImContentType({required this.attributes});

  factory ImContentTypeImContentType.fromJson(Map<String, dynamic> json) =>
      ImContentTypeImContentType(
        attributes: ImContentTypeAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {"attributes": attributes.toJson()};
}

class ImImage {
  String label;
  ImImageAttributes attributes;

  ImImage({required this.label, required this.attributes});

  factory ImImage.fromJson(Map<String, dynamic> json) => ImImage(
    label: json["label"],
    attributes: ImImageAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "attributes": attributes.toJson(),
  };
}

class ImImageAttributes {
  String height;

  ImImageAttributes({required this.height});

  factory ImImageAttributes.fromJson(Map<String, dynamic> json) =>
      ImImageAttributes(height: json["height"]);

  Map<String, dynamic> toJson() => {"height": height};
}

class ImPrice {
  String label;
  ImPriceAttributes attributes;

  ImPrice({required this.label, required this.attributes});

  factory ImPrice.fromJson(Map<String, dynamic> json) => ImPrice(
    label: json["label"],
    attributes: ImPriceAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "attributes": attributes.toJson(),
  };
}

class ImPriceAttributes {
  String amount;
  Currency currency;

  ImPriceAttributes({required this.amount, required this.currency});

  factory ImPriceAttributes.fromJson(Map<String, dynamic> json) =>
      ImPriceAttributes(
        amount: json["amount"],
        currency: currencyValues.map[json["currency"]]!,
      );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currencyValues.reverse[currency],
  };
}

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

class ImReleaseDate {
  DateTime label;
  AlbumIcon attributes;

  ImReleaseDate({required this.label, required this.attributes});

  factory ImReleaseDate.fromJson(Map<String, dynamic> json) => ImReleaseDate(
    label: DateTime.parse(json["label"]),
    attributes: AlbumIcon.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "label": label.toIso8601String(),
    "attributes": attributes.toJson(),
  };
}

class Link {
  LinkAttributes attributes;

  Link({required this.attributes});

  factory Link.fromJson(Map<String, dynamic> json) =>
      Link(attributes: LinkAttributes.fromJson(json["attributes"]));

  Map<String, dynamic> toJson() => {"attributes": attributes.toJson()};
}

class LinkAttributes {
  Rel rel;
  Type? type;
  String href;

  LinkAttributes({required this.rel, this.type, required this.href});

  factory LinkAttributes.fromJson(Map<String, dynamic> json) => LinkAttributes(
    rel: relValues.map[json["rel"]]!,
    type: typeValues.map[json["type"]]!,
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "rel": relValues.reverse[rel],
    "type": typeValues.reverse[type],
    "href": href,
  };
}

enum Rel { ALTERNATE, SELF }

final relValues = EnumValues({"alternate": Rel.ALTERNATE, "self": Rel.SELF});

enum Type { TEXT_HTML }

final typeValues = EnumValues({"text/html": Type.TEXT_HTML});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
