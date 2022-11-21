class Item {
  final String id;
  final String name;
  final String description;
  final String price;
  final String color;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.imageUrl});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      price: map["price"],
      color: map["color"],
      imageUrl: map["imageUrl"],
    );
  }
}

class Catalog {
  static List<Item> Items = [];
}
