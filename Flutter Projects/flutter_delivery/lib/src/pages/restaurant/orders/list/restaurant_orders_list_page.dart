import 'package:flutter/material.dart';

class RestaurantOrdersListPage extends StatefulWidget {
  const RestaurantOrdersListPage({Key key}) : super(key: key);

  @override
  State<RestaurantOrdersListPage> createState() => _RestaurantOrdersListPageState(),
}

class _RestaurantOrdersListPageState extends State<RestaurantOrdersListPageState> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('Restaurant Orders List'),
      ),
    );
  }

}