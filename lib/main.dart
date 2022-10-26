import 'package:currency_converter_app/modals/app_theme.dart';
import 'package:currency_converter_app/providers/app_theme_provider.dart';
import 'package:currency_converter_app/providers/converter_provider.dart';

import '/utils/appRoutes.dart';
import '/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<ConverterProvider>(
          create: (context) => ConverterProvider(),
        ),
      ],
      builder:(context,_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: (Provider.of<ThemeProvider>(context).obj.isDark) ? ThemeMode.dark : ThemeMode.light,
        title: "Currency Converter App",
        theme: ThemeData(
          primaryColor: Colors.blue,
          backgroundColor: Colors.white,
          secondaryHeaderColor: Colors.black,
          fontFamily: "Poppins",
          cardColor: Colors.black54,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        darkTheme: ThemeData(
          backgroundColor: Colors.black87,
          primaryColor: Colors.tealAccent,
          secondaryHeaderColor: Colors.white,
          cardColor: Colors.grey.withOpacity(0.6),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          fontFamily: "Poppins",
        ),
        //home: HomePage(),
        initialRoute: AppRoutes().homePage,
        routes: routes,
      ),
    );
  }
}
