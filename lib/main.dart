import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_ufs/bloc/getProductsBloc/bloc/get_products_bloc.dart';
import 'package:shopping_app_ufs/bloc/getProductsDeatils/bloc/products_details_bloc.dart';
import 'package:shopping_app_ufs/bloc/postProductsBloc/bloc/post_products_bloc.dart';
import 'package:shopping_app_ufs/view/home/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductsBloc()..add(GetAllProductsEvent()),
        ),
        BlocProvider(
          create: (context) => ProductsDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => PostProductsBloc(),
          
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
