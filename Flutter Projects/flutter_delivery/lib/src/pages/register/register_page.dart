import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/pages/register/register_controller.dart';
import 'package:flutter_delivery/src/utils/custom_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage ({Key key}) : super(key:key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController _con = new RegisterController();

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
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circle(),
            ),
            Positioned(
                top: 51,
                left: -5,
                child: _backIcon()
            ),
            Positioned(
                top: 65,
                left: 27,
                child: _textRegister()
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      _imageUSer(),
                      SizedBox(height: 10),
                      _textFieldEmail(),
                      _textFieldName(),
                      _textFieldLastName(),
                      _textPhone(),
                      _textPassword(),
                      _textConfirmPassword(),
                      _buttonRegister()
                    ],
                ),
              ),
            )
          ]
        )
      )
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
            hintText: 'Confirmar contraseña',
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
        child: Text('REGISTRARSE'),
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
