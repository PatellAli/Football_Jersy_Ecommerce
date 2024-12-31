import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/auth/auth_service.dart';
import 'package:football_jersy_ecommerce/database/order_database.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  final order = OrderDatabase();
  final authService = AuthService();
  late String? userEmail;
  @override
  void initState() {
    super.initState();
    userEmail = authService.getUser();
  }

  @override
  Widget build(BuildContext context) {
    if (userEmail == null) {
      return const Center(
        child: Text("You must be logged in to view orders."),
      );
    }
    return Column(
      children: [
        Text("Your Orders"),
        FutureBuilder(
          future: order.fetchOrders(userEmail),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No orders found."));
            } else {
              final orders = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final list = orders[index];
                    int pr = list.price!;
                    int quan = list.quantity!;
                    return ListTile(
                      leading: list.jerseyImage != null
                          ? Image.network(list.jerseyImage!)
                          : const Icon(Icons.image_not_supported),
                      title: Text("${list.jerseyName!} x${list.quantity}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size: ${list.size!}"),
                          Text("Total: ${pr * quan}"),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
