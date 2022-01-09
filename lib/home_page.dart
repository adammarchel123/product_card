import 'package:belajar_card/product_card.dart';
import 'package:belajar_card/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Belajar Card'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Consumer<ProductState>(
              builder: (context, state, child) => ProductCard(
                discount: 10,
                isDiscount: state.pcs >= 5,
                pcs: state.pcs,
                stock: 10,
                onIncTap: () {
                  state.pcs++;
                },
                onDecTap: () {
                  state.pcs--;
                },
                onAddCartTap: () {},
                price: 25000,
                image:
                    'https://www.asliindonesia.net/wp-content/uploads/2015/05/buah-buahan.jpg',
                name: 'Buah mix ${state.pcs} kg',
              ),
            ),
          ),
        ));
  }
}
