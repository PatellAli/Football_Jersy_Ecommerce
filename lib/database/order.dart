class Order {
  int? id;
  int? item_id;
  String? user;
  int? quantity;
  String? address;
  String? phone_number;
  String? size;
  String? jerseyName; // From Jersy_info table
  String? jerseyImage;
  int? price; // From Jersy_info table

  Order({
    this.id,
    required this.item_id,
    required this.user,
    required this.quantity,
    required this.address,
    required this.phone_number,
    required this.size,
    this.jerseyName,
    this.jerseyImage,
    this.price,
  });

  //map ---> note
  factory Order.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic>? jerseyInfo =
        map['Jersy_info'] as Map<String, dynamic>?;

    return Order(
      id: map['id'] as int?,
      item_id: map['item_id'] as int?,
      user: map['user'] as String?,
      quantity: map['quantity'] as int?,
      address: map['address'] as String?,
      phone_number: map['phone_number'] as String?,
      size: map['size'] as String?,
      jerseyName: jerseyInfo?['name'] as String?,
      jerseyImage: jerseyInfo?['image'] as String?,
      price: jerseyInfo?['price'] as int?,
    );
  }

  //note ---> map
  Map<String, dynamic> toMap() {
    return {
      'item_id': item_id,
      'user': user,
      'quantity': quantity,
      'address': address,
      'phone_number': phone_number,
      'size': size,
    };
  }
}
