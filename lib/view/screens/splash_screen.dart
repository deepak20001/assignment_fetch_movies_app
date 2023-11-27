import 'package:fetch_movies_app/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      // exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
      ));

      // navigate to home screen
      Routes.instance
          .pushReplacement(widget: const BottomNavBar(), context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Binge Movies!!"),
      ),

      // body
      body: Stack(
        children: [
          // app logo
          Positioned(
            top: MediaQuery.of(context).size.height * .15,
            right: MediaQuery.of(context).size.width * .25,
            width: MediaQuery.of(context).size.width * .5,
            child: Image.asset("assets/movie_splash.png"),
          ),

          // google login button
          Positioned(
            bottom: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "MADE IN INDIA WITH ❤️",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
