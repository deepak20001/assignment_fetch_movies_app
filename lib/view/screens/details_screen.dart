// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/movie_model.dart';
import 'package:flutter/src/widgets/image.dart' as flutter_image;

class DetailsScreen extends StatelessWidget {
  final MovieModel singleMovie;
  const DetailsScreen({
    Key? key,
    required this.singleMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(singleMovie.show?.image?.medium ?? "");

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  singleMovie.show!.name.toString(),
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: flutter_image.Image.network(
                    singleMovie.show!.image?.original ?? "",
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return flutter_image.Image.asset("assets/no_image.png");
                    },
                    fit: BoxFit.cover,
                    height: 400,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  singleMovie.show!.summary.toString(),
                  style: GoogleFonts.montserrat(textStyle: const TextStyle()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
