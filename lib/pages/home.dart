import 'package:flutter/material.dart';
import 'package:submission_restaurantappv1/pages/restaurant_list.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Restaurant',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontSize: 25),
              ),
              Text(
                'Recommendation restaurant for you!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 30),
              const Expanded(child: ListRestaurant()),
            ],
          ),
        ),
      ),
    );
  }
}
