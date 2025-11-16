import 'package:e_commerce_app/helpers/cubit/all_product_cubit.dart';
import 'package:e_commerce_app/helpers/cubit/stable_cart_cubit.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/views/cart_view.dart';
import 'package:e_commerce_app/views/product_view.dart';
import 'package:e_commerce_app/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProductModel> kProducts = [];
  @override
  void initState() {
    context.read<AllProductCubit>().fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        title: Text('E-Commerce App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchView()),
            );
          },
          icon: Icon(Icons.search, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartView(products: kProducts),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<AllProductCubit, AllProductState>(
        builder: (context, state) {
          if (state is AllProductLoaded) {
            final products = state.products;
            kProducts = products;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            );
          } else if (state is AllProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state is AllProductError ? state.message : 'Unkown Error',
                  ),
                  Gap(4),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AllProductCubit>().fetchAllProducts();
                    },
                    child: Text('Refresh'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductView(product: product),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: ListTile(
          leading: Image.network(product.image, height: 50, width: 50),
          title: Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text('\$${product.price}'),
          trailing: IconButton(
            onPressed: () {
              context.read<StableCartCubit>().addItem(product);
            },
            icon: Icon(Icons.add_shopping_cart),
          ),
        ),
      ),
    );
  }
}
