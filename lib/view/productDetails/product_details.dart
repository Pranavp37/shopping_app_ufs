import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_ufs/bloc/getProductsDeatils/bloc/products_details_bloc.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.index});

  final int index;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<ProductsDetailsBloc>()
            .add(GetProductsDetailsEvent(id: widget.index));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product details'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: BlocBuilder<ProductsDetailsBloc, ProductsDetailsState>(
          builder: (context, state) {
            if (state is ProductsDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductsDetailsSuccess) {
              var data = state.proData;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      height: MediaQuery.of(context).size.height / 2.3,
                      data!.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data.title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Rs: ${data.price.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Rs: ${data.description.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
                  )
                ],
              );
            }

            return const Text('No Data');
          },
        ),
      ),
    );
  }
}
