import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/pages/client/update/client_update_controller.dart';
import 'package:flutter_delivery/src/pages/register/register_controller.dart';
import 'package:flutter_delivery/src/utils/custom_colors.dart';

class ClientUpdatePage extends StatefulWidget {
  const ClientUpdatePage ({Key key}) : super(key:key);

  @override
  State<ClientUpdatePage> createState() => _ClientUpdatePageState();
}

class _ClientUpdatePageState extends State<ClientUpdatePage> {

  ClientUpdateController _con = new ClientUpdateController();

  @override
  void initState(){
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
        body: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  _imageUSer(),
                  SizedBox(height: 30),
                  _textFieldName(),
                  _textFieldLastName(),
                  _textPhone()
                ],
              ),
            ),
        ),
        bottomNavigationBar: _buttonRegister(),
    );
  }

  Widget _imageUSer(){
    return GestureDetector(
      onTap: _con.showAlertDialog,
      child: CircleAvatar(
        backgroundImage: _con.imageFile != null
            ? FileImage(_con.imageFile)
            : AssetImage('assets/img/user_profile_2.png'),
        radius: 60,
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _circle(){
    return Container(
      width: 260,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: CustomColors.primaryColor
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: CustomColors.primaryColorField
      ),

      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
              color: CustomColors.primaryColorDock
          ),
          prefixIcon: Icon(
            Icons.email,
            color: CustomColors.primaryColorDock,
          ),
        ),
      ),
    );
  }

  Widget _textFieldName(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: CustomColors.primaryColorField
      ),
      child: TextField(
        controller: _con.nameController,
        decoration: InputDecoration(
            hintText: 'Nombre',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: CustomColors.primaryColorDock
            ),
            prefixIcon: Icon(
              Icons.person,
              color: CustomColors.primaryColorDock,
            )
        ),
      ),
    );
  }
  Widget _textFieldLastName(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: CustomColors.primaryColorField
      ),
      child: TextField(
        controller: _con.lastnameController,
        decoration: InputDecoration(
            hintText: 'Apellidos',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: CustomColors.primaryColorDock
            ),
            prefixIcon: Icon(
              Icons.person_outline,
              color: CustomColors.primaryColorDock,
            )
        ),
      ),
    );
  }

  Widget _textPhone(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: CustomColors.primaryColorField
      ),
      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: 'Telefono',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: CustomColors.primaryColorDock
            ),
            prefixIcon: Icon(
              Icons.phone,
              color: CustomColors.primaryColorDock,
            )
        ),
      ),
    );
  }

  Widget _textPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: CustomColors.primaryColorField
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: CustomColors.primaryColorDock
            ),
            prefixIcon: Icon(
                Icons.lock,
                color: CustomColors.primaryColorDock
            )
        ),
      ),
    );
  }

  Widget _textConfirmPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: CustomColors.primaryColorField
      ),
      child: TextField(
        controller: _con.confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: CustomColors.primaryColorDock
            ),
            prefixIcon: Icon(
                Icons.lock_outline,
                color: CustomColors.primaryColorDock
            )
        ),
      ),
    );
  }

  Widget _buttonRegister(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _con.isEnable ? _con.register : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.all(23),
        ),
        child: Text('Actualizar perfil'),
      ),
    );
  }

  Widget _backIcon(){
    return IconButton(
      onPressed: _con.goToLoginPage,
      icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white,),
    );
  }
  Widget _textRegister(){
    return Text(
      'REGISTRO',
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'NimbusSans',
          fontSize: 22,
          fontWeight: FontWeight.bold
      ),
    );
  }

  void refresh(){
    setState(() {

    });
  }
}
