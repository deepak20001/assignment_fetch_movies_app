import 'package:fetch_movies_app/controllers/home_provider.dart';
import 'package:fetch_movies_app/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // enter full-screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // for setting orientation to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            background: Colors.black,
            primary: Colors.grey[900]!,
            secondary: Colors.grey[800]!,
          ),
          useMaterial3: true,
        ).copyWith(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
