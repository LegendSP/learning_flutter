class Item {
  final String id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.imageUrl});
}

class Catalog {
  static final Items = [
    Item(
        id: "sp007",
        name: "iPhone 12",
        description: "iOS",
        price: 999,
        color: "#ffffff",
        imageUrl: "images/login_img.png")
  ];
}
