import 'package:flutter/material.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({Key key}) : super(key: key);

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona el rol'),
      ),
      body: center(
        child: Text('Roles'),
      ), //Center
    );
  }

  Widget _cardRol(Rol rol){
     return Column(
      children: [
        Container(
          height: 100,
          child: FadeInImage(
            image: rol.image != null
                ? NetworkImage('assets/img/no-image.png'),
            fit: BoxFit.contain,
            fadeInDuration: Duration(milliseconds: 50),
            placeholder: AssetImage('assets/img/no-image.png'),
          ),
        ),
     ],
    ); // Column
}