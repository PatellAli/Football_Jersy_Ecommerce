import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/database/jersy_database.dart';
import 'package:football_jersy_ecommerce/pages/display_page.dart';

class JersyTileAll extends StatefulWidget {
  JersyTileAll({super.key});

  @override
  State<JersyTileAll> createState() => _JersyTileAllState();
}

class _JersyTileAllState extends State<JersyTileAll> {
  final db = JersyDatabase();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No data available"),
          );
        }

        //loaded
        final info = snapshot.data!;

        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two items per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // Adjust item height
              mainAxisExtent: 250,
            ),
            itemCount: info.length,
            itemBuilder: (context, index) {
              final cloth = info[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPage(cloth: cloth),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 0.5,
                        color: const Color.fromARGB(255, 26, 50, 99)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          cloth.image,
                          height: 130,
                        ),
                        Text(
                          cloth.name,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "₹" + cloth.price.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              cloth.inStock ? "Available" : "Out of stock",
                              style: TextStyle(
                                color:
                                    cloth.inStock ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
