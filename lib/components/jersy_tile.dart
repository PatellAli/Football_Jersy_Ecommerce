import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/database/jersy_database.dart';
import 'package:football_jersy_ecommerce/pages/display_page.dart';

class JersyTile extends StatelessWidget {
  int? count;
  String Jersyname;

  final db = JersyDatabase();

  JersyTile({super.key, required this.count, required this.Jersyname});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.stream,
      builder: (context, snapshot) {
        //loading
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //loaded
        final info = snapshot.data!;
        final filteredInfo = info.where((cloth) {
          return cloth.name.toLowerCase().contains(Jersyname.toLowerCase());
        }).toList();

        final itemcount = count ?? filteredInfo.length;

        //DATA in UI
        return SizedBox(
          height: 450,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemcount,
            itemBuilder: (context, index) {
              final cloth = filteredInfo[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayPage(cloth: cloth),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 0.5,
                            color: const Color.fromARGB(255, 26, 50, 99))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          cloth.image,
                          height: 240,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            cloth.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "₹" + cloth.price.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cloth.inStock ? "Available" : "Out of stock",
                          style: TextStyle(
                            color: cloth.inStock ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
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
