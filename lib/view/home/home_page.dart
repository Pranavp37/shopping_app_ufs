import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_ufs/bloc/getProductsBloc/bloc/get_products_bloc.dart';
import 'package:shopping_app_ufs/bloc/postProductsBloc/bloc/post_products_bloc.dart';
import 'package:shopping_app_ufs/model/product_model.dart';
import 'package:shopping_app_ufs/view/productDetails/product_details.dart';
import 'package:shopping_app_ufs/view/widgets/home_screen_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: const InputDecoration(hintText: 'title'),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: priceController,
                          decoration: const InputDecoration(hintText: 'price'),
                        ),
                        TextField(
                          controller: descController,
                          decoration:
                              const InputDecoration(hintText: 'description'),
                        ),
                        TextField(
                          controller: categoryController,
                          decoration:
                              const InputDecoration(hintText: 'category'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Back',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                )),
                            BlocConsumer<PostProductsBloc, PostProductsState>(
                              listener: (context, state) {
                                if (state is PostProductsLoading) {
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is PostProductsSuccess) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Product add Successfully'),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is PostProductsError) {
                                  return Text(state.error);
                                }
                                return ElevatedButton(
                                  onPressed: () {
                                    context.read<PostProductsBloc>().add(
                                        PostProductsDataEvent(
                                            postData: ProductModel(
                                                title: titleController.text,
                                                category:
                                                    categoryController.text,
                                                description:
                                                    descController.text,
                                                price: double.parse(
                                                    priceController.text))));
                                  },
                                  child: const Text(
                                    'Add Products',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: const Text('FAB'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            BlocBuilder<GetProductsBloc, GetProductsState>(
              builder: (context, state) {
                if (state is GetProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetProductsSuccess) {
                  return Expanded(
                      child: GridView.builder(
                    itemCount: state.proData!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      var data = state.proData![index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                index: index + 1,
                              ),
                            ));
                          },
                          child: HomeScreenCard(data: data));
                    },
                  ));
                }
                if (state is GetProductsError) {
                  return Text(state.error.toString());
                }
                return const Text('No Data');
              },
            )
          ],
        ),
      ),
    );
  }
}
