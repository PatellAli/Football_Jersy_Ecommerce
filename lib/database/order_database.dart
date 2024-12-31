import 'package:football_jersy_ecommerce/database/order.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderDatabase {
  //database ---> Order
  final database = Supabase.instance.client.from('Order');

  get item_id => null;

  //Create
  Future createOrder(Order order) async {
    await database.insert(order.toMap());
  }

  Future<List<Order>> fetchOrders(String? userEmail) async {
    final response = await database
        .select('item_id, quantity, size, Jersy_info(name, image, price)')
        .eq('user', userEmail!);

    if (response == null) {
      throw Exception('Failed to fetch data');
    }

    return (response as List).map((order) => Order.fromMap(order)).toList();
  }
}
