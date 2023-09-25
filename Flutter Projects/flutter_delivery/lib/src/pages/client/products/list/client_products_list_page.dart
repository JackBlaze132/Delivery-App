import 'package:flutter/material.dart';

class ClientProductsListPage extends StatefulWidget {
  const ClientProductsListPage({Key key});

  @override
  State<ClientProductsListPage> createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Lista de productos'),
      ),
    );
  }
}
