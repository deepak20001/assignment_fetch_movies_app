import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // OutlineInputBorder style
  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFEEF0F3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            // controller: controller,

            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              // hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: const Color(0xFF8D98A4),
                  ),
              contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              focusedBorder: border(),
              enabledBorder: border(),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
