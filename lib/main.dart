import 'package:e_commerce_app/helpers/cubit/all_product_cubit.dart';
import 'package:e_commerce_app/helpers/cubit/product_by_id_cubit.dart';
import 'package:e_commerce_app/helpers/cubit/stable_cart_cubit.dart';
import 'package:e_commerce_app/helpers/providers/cart_indecator.dart';
import 'package:e_commerce_app/models/cart_item_model_enhanced.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemModelEnhancedAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(RatingAdapter());
  await Hive.openBox<CartItemModelEnhanced>('stableCartBox');
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartIndecator(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AllProductCubit()),
        BlocProvider(create: (context) => ProductByIdCubit()),
        BlocProvider(create: (context) => StableCartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commmerce',
        home: HomeView(),
      ),
    );
  }
}
