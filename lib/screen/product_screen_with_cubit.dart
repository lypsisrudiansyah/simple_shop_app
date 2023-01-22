import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shop_app/bloc/product/product_bloc.dart';

class ProductScreenWithCubit extends StatelessWidget {
  const ProductScreenWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Shop"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final products = state.result;

            return GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: ((context, index) {
                final product = products[index];
                return GridTile(
                  // footer: Text(product.title),
                  footer: GridTileBar(
                    backgroundColor: Colors.black38,
                    title: Text(
                      product.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              }),
            );
          }

          return const Center(
            child: Text("Data not Available"),
          );
        },
      ),
    );
  }
}