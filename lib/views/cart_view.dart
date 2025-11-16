import 'package:e_commerce_app/helpers/cubit/stable_cart_cubit.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        foregroundColor: Color(0xffffffff),
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<StableCartCubit, StableCartState>(
                builder: (context, state) {
                  if (state is StableCartLoaded) {
                    return ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = state.cartItems[index];
                        return Card(
                          color: Colors.white,
                          elevation: 2,
                          child: ListTile(
                            leading: Image.network(
                              item.product.image,
                              height: 50,
                              width: 50,
                            ),
                            title: Text(
                              item.product.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text('\$${item.product.price}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<StableCartCubit>()
                                        .decreaseItem(item.product);
                                    totalPrice -= item.product.price * 2;
                                  },
                                  icon: Icon(Icons.remove_circle_outline),
                                ),
                                Text('${item.qty}'),
                                IconButton(
                                  onPressed: () {
                                    context.read<StableCartCubit>().addItem(
                                      item.product,
                                    );
                                  },
                                  icon: Icon(Icons.add_circle_outline),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is StableCartLoading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Something went wrong!')],
                    );
                  }
                },
              ),
            ),
            Divider(color: Color(0xff121212)),
            Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                BlocBuilder<StableCartCubit, StableCartState>(
                  builder: (context, state) {
                    if (state is StableCartLoaded) {
                      return Text(
                        '\$${state.cartTotalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return Text(
                        '\$0.00',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Gap(16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xff121212),
                foregroundColor: Color(0xffffffff),
              ),
              onPressed: () {},
              child: Text('Checkout'),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
