import 'package:flutter/material.dart';

class SearchBarText extends StatelessWidget {
  Function(String)? onSearch;
  SearchBarText({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onSearch!(value),
      decoration: const InputDecoration(
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
