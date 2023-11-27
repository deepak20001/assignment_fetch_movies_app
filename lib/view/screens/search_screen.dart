import 'package:fetch_movies_app/view/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import '../../controllers/home_provider.dart';
import 'package:flutter/src/widgets/image.dart' as flutter_image;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  // OutlineInputBorder style
  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFEEF0F3)),
    );
  }

  void getData(String searched) async {
    final homeProvider = context.read<HomeProvider>();
    await homeProvider.searchMovies(searched);
    print(homeProvider.searchedMovies.length);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search Movies here!",
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color(0xFF8D98A4),
                      ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: border(),
                  enabledBorder: border(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      getData(_searchController.text);
                      SystemChannels.textInput.invokeMethod('TextInput.hide');

                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              homeProvider.isLoading == true
                  ? Padding(
                    padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .4),
                    child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                  )
                  : homeProvider.searchedMovies.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .4),
                          child: Center(
                            child: Text(
                              "No movies found !",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: homeProvider.searchedMovies.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: DetailsScreen(
                                      singleMovie:
                                          homeProvider.searchedMovies[index],
                                    ),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.white70, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GridTile(
                                    footer: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          homeProvider.searchedMovies[index]
                                                  .show?.name
                                                  .toString() ??
                                              "null",
                                          style: GoogleFonts.montserrat(
                                              textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                      ),
                                    ),
                                    child: flutter_image.Image.network(
                                      homeProvider.searchedMovies[index].show!
                                              .image?.original ??
                                          "",
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return flutter_image.Image.asset(
                                            "assets/no_image.png");
                                      },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
