import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shop_app/bloc/product/product_bloc.dart';
import 'package:simple_shop_app/screen/home_screen.dart';
import 'package:simple_shop_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        title: 'Simple Shop App',
        theme: ThemeData(
          primaryColor: primaryColorCustom,
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColorCustom),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
