
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/pages/login/login_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_delivery/src/utils/custom_colors.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key:key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

  @override
  void initState(){
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -100,
                child: _circleLogin()),
            Positioned(
                top: 60,
                left: 25,
                child: _textLogin()),
            SingleChildScrollView(
              child: Column(
                  children: [
                      /*_imageBanner(),*/
                    _lottieAnimation(),
                    _textFieldEmail(),
                    _textFieldPassword(),
                    _buttonLogin(),
                    _textDontHaveAccount(),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleLogin(){
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: CustomColors.primaryColor,
      ),
    );
  }

  Widget _textLogin(){
    return Text(
      'LOGIN',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _lottieAnimation(){
    return Container(
      margin: EdgeInsets.only(
        top: 160,
        bottom: MediaQuery.of(context).size.height * 0.08
      ),
      child: Lottie.asset(
        'assets/json/delivery.json',
        height: 250,
        fit: BoxFit.fill
      )
    );
  }
  Widget _imageBanner(){
    return Container(
      margin: EdgeInsets.only(
        top: 170,
        bottom: MediaQuery.of(context).size.height * 0.08,
      ),
      child: Lottie.asset(
        'assets/img/delivery.png',
        height: 250,
      )
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: CustomColors.primaryColorField,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electrónico',
          hintStyle: TextStyle(
              color: CustomColors.primaryColorDock
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.mail, color: CustomColors.primaryColorDock,
          ),
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: CustomColors.primaryColorField,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: CustomColors.primaryColorDock),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(Icons.lock, color: CustomColors.primaryColorDock,),
        ),
      ),
    );
  }

  Widget _buttonLogin(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _con.login,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(23),
        ), // StyleForm
        child: const Text('INGRESAR')
      ),
    );
  }

  Widget _textDontHaveAccount(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?'
        ),

        SizedBox(
          width: 7,),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColors.primaryColor),
          ),
        )
      ],
    );
  }
}