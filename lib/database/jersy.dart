class Jersy {
  int? id;
  String name;
  int price;
  bool inStock;
  String image;
  bool Size_S;
  bool Size_M;
  bool Size_L;
  bool Size_XL;

  Jersy({
    this.id,
    required this.name,
    required this.price,
    required this.inStock,
    required this.image,
    required this.Size_S,
    required this.Size_M,
    required this.Size_L,
    required this.Size_XL,
  });

  //map -->note

  factory Jersy.fromMap(Map<String, dynamic> map) {
    return Jersy(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      inStock: map['inStock'] as bool,
      image: map['image'] as String,
      Size_S: map['Size_S'] as bool,
      Size_M: map['Size_M'] as bool,
      Size_L: map['Size_L'] as bool,
      Size_XL: map['Size_XL'] as bool,
    );
  }
}
