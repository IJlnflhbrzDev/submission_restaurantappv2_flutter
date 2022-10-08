// ignore_for_file: avoid_print, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:submission_restaurantappv1/pages/restaurant_detail.dart';

class ListRestaurant extends StatelessWidget {
  const ListRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> map = [];

    return Scaffold(
      body: FutureBuilder<String>(
        future: _loadRestaurantAssets(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          try {
            if (snapshot.hasData) {
              map = List<Map<String, dynamic>>.from(
                  json.decode(snapshot.data)['restaurants']);
              final dataRestaurant = map;
              // return Text(dataRestaurant['id']);
              return Center(
                child: ListView.builder(
                  itemCount: dataRestaurant.length,
                  itemBuilder: (context, index) {
                    var listDataRestaurant = dataRestaurant[index];
                    var listFoods =
                        listDataRestaurant['menus']['foods'].map((e) {
                      return e;
                    }).toList();
                    var listDrinks =
                        listDataRestaurant['menus']['drinks'].map((e) {
                      return e;
                    }).toList();
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantDetail(
                              restaurantID: listDataRestaurant['id'],
                              restaurantNAME: listDataRestaurant['name'],
                              restaurantCITY: listDataRestaurant['city'],
                              restaurantDESCRIPTION:
                                  listDataRestaurant['description'],
                              restaurantPICTUREID:
                                  listDataRestaurant['pictureId'],
                              restaurantRATING:
                                  listDataRestaurant['rating'].toString(),
                              restaurantFood: listFoods,
                              restaurantDrink: listDrinks,
                            ),
                          ),
                        );

                        // print(test[0]);
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.transparent,
                                blurRadius: 1,
                                offset: Offset(0, 0), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    listDataRestaurant['pictureId'],
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: 80),
                              )),
                              const SizedBox(width: 15),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listDataRestaurant['name'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on_outlined,
                                              color: Colors.grey, size: 16),
                                          Text(
                                            listDataRestaurant['city'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_outlined,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            listDataRestaurant['rating']
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                  color: Colors.grey,
                                                ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              throw Exception('Failed To Load Data');
            }
          } catch (e) {
            print(e);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<String> _loadRestaurantAssets() async {
    return await rootBundle.loadString('assets/restaurant.json');
  }
}
