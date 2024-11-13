import 'package:flutter/material.dart';
import 'package:shopping_app_ufs/model/product_model.dart';

class HomeScreenCard extends StatelessWidget {
   const HomeScreenCard({super.key, required this.data});
 final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Image.network(
                                  height: 100,
                                  data.image.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(data.title.toString()),
                              Text("Rs ${data.price.toString()}"),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        );
  }
}