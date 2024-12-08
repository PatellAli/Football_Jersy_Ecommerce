import 'package:flutter/material.dart';

class SearchBarText extends StatelessWidget {
  const SearchBarText({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
