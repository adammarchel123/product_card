import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final Function() onAddCartTap;
  final Function() onDecTap;
  final Function() onIncTap;
  final int pcs;
  final int stock;
  final bool isDiscount;
  final int discount;

  const ProductCard({
    Key? key,
    this.image =
        'https://www.asliindonesia.net/wp-content/uploads/2015/05/buah-buahan.jpg',
    this.name = 'Buah mix 1 kg',
    this.price = 0,
    required this.onAddCartTap,
    required this.onDecTap,
    required this.onIncTap,
    this.pcs = 0,
    this.stock = 0,
    this.isDiscount = false,
    this.discount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = (stock - pcs) / stock;

    double width = 150;
    TextStyle style = TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.bold,
        color: Colors.grey[800]);
    return Stack(
      children: [
        //notifikasi
        AnimatedContainer(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.only(bottom: 5),
          duration: Duration(milliseconds: 500),
          width: 130,
          height: isDiscount ? 320 : 300,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(16)),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Diskon $discount%',
                style: style.copyWith(color: Colors.white, fontSize: 12),
              )),
        ),
        //card
        Container(
          width: width,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: Offset(1, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //atas
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //gambar
                  Container(
                      width: width,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(image), fit: BoxFit.cover))),
                  //nama
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      name,
                      style: style,
                    ),
                  ),
                  //harga
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp. ', decimalDigits: 0)
                          .format(pcs == 0 ? price : price * pcs),
                      style: style.copyWith(
                          decoration: isDiscount
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              //tengah
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    //detail stock
                    Row(
                      children: [
                        Icon(
                          Icons.view_in_ar,
                          color: Colors.grey[800],
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '$pcs/$stock pcs',
                          style: style.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    //animasi stock
                    Stack(
                      children: [
                        Container(
                          width: width,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey[300]),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: width * ratio,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: ratio < 0.33
                                  ? Colors.red
                                  : ratio < 0.77
                                      ? Colors.amber
                                      : Colors.green),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //bawah
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: width,
                    height: 30,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //button -
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: pcs > 0 ? onDecTap : () {},
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        //pcs
                        Text(pcs.toString(), style: style),

                        //button +
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: pcs < stock ? onIncTap : () {},
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //button add to cart
                  Container(
                    margin: EdgeInsets.all(5),
                    width: width,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16))),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(16)),
                      child: InkWell(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                        onTap: onAddCartTap,
                        child: Icon(
                          Icons.shopping_cart,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
