import 'package:ceramic_shop/view/bottom_bar.dart';
import 'package:ceramic_shop/view/home_screen.dart';
import 'package:ceramic_shop/provider/dark_theme_provider.dart';
import 'package:ceramic_shop/view/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/them_data.dart';
import 'inner_screens/on_sale_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}): super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   DarkThemeProvider themeChangeProvider = DarkThemeProvider();

   void getCurrentAppTheme()async{
     themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemPref.getTheme();
   }
   @override
  void initState() {
     getCurrentAppTheme();
    super.initState();
  }

   @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){return themeChangeProvider;})
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context,themeProvider,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const BottomBarScreen(),
            routes: {
              OnSaleScreen.routeName : (ctx) =>const OnSaleScreen(),
            },
          );

        }
      ),
    );
  }
}