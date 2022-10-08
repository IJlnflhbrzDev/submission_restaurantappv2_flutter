// ignore_for_file: avoid_unnecessary_containers, unrelated_type_equality_checks

import 'package:flutter/material.dart';

class RestaurantDetail extends StatelessWidget {
  const RestaurantDetail({
    Key? key,
    required this.restaurantID,
    required this.restaurantPICTUREID,
    required this.restaurantNAME,
    required this.restaurantCITY,
    required this.restaurantRATING,
    required this.restaurantDESCRIPTION,
    required this.restaurantFood,
    required this.restaurantDrink,
  }) : super(key: key);
  static const routeName = '/restaurant_detaild';

  final String? restaurantID;
  final String? restaurantPICTUREID;
  final String? restaurantNAME;
  final String? restaurantCITY;
  final String? restaurantRATING;
  final String? restaurantDESCRIPTION;
  final List restaurantFood;
  final List restaurantDrink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(15)),
                child: Image.network(
                  '$restaurantPICTUREID',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$restaurantNAME',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.zero,
                              child: Icon(Icons.location_on_outlined,
                                  color: Colors.grey, size: 16),
                            ),
                            Text(
                              '$restaurantCITY',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_outlined,
                              size: 16,
                              color: Colors.grey,
                            ),
                            Text(
                              restaurantRATING.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$restaurantDESCRIPTION',
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Menu Makanan',
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 3),
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: restaurantFood.length,
                          itemBuilder: (context, index) {
                            var foodName = restaurantFood[index]['name'];
                            return Container(
                              color: const Color.fromARGB(255, 220, 220, 220),
                              margin: const EdgeInsets.only(right: 5),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(foodName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 13, height: 1.7)),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('Menu Minuman',
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 3),
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: restaurantDrink.length,
                          itemBuilder: (context, index) {
                            var drinkName = restaurantDrink[index]['name'];
                            return Container(
                              color: const Color.fromARGB(255, 220, 220, 220),
                              margin: const EdgeInsets.only(right: 5),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(drinkName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 13, height: 1.7)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
