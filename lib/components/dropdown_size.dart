import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/database/jersy.dart';

class DropdownSize extends StatefulWidget {
  final Jersy cloth;
  const DropdownSize({super.key, required this.cloth});

  @override
  State<DropdownSize> createState() => _DropdownSizeState();
}

class _DropdownSizeState extends State<DropdownSize> {
  String? selectedSize;
  @override
  Widget build(BuildContext context) {
    final availableSizes = <String>[
      if (widget.cloth.Size_S) 'S',
      if (widget.cloth.Size_M) 'M',
      if (widget.cloth.Size_L) 'L',
      if (widget.cloth.Size_XL) 'X',
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth, // Ensure a bounded width
          child: Row(
            children: [
              const Text(
                'Select Size: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: DropdownButton<String>(
                  focusColor: Colors.grey,
                  value: selectedSize,
                  items: availableSizes
                      .map((size) => DropdownMenuItem(
                            value: size,
                            child: Text(size),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSize = value;
                    });
                  },
                  hint: const Text('Choose Size'),
                  isExpanded: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
