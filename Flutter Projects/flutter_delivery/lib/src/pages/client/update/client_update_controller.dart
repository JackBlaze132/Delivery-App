import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/models/response_api.dart';
import 'package:flutter_delivery/src/provider/user_provider.dart';
import 'package:flutter_delivery/src/utils/my_snackbar.dart';
import 'package:flutter_delivery/src/utils/shared_pref.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../models/user.dart';

class ClientUpdateController{

  BuildContext context;

  TextEditingController nameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  UserProvider usersProvider = new UserProvider();

  XFile xFile;
  File imageFile;
  Function refresh;
  ProgressDialog _progressDialog;
  bool isEnable = true;
  User user;
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context, Function refresh) async{
    this.context = context;
    this.refresh = refresh;
    usersProvider.init(context);
    _progressDialog = ProgressDialog(context: context);

    user = User.fromJson(await _sharedPref.read('user'));

    nameController.text = user.name;
    lastnameController.text = user.lastname;
    phoneController.text = user.phone;

    refresh();
  }

  void update() async{
    String name = nameController.text.trim();
    String lastname = lastnameController.text.trim();
    String phone = phoneController.text.trim();

    if(name.isEmpty || lastname.isEmpty || phone.isEmpty){
      MySnackbar.show(context, "Debes ingresar todos los campos");
      return;
    }


    /*if(imageFile == null){
      MySnackbar.show(context, 'Seleccione una imagen');
      return;
    }*/

    _progressDialog.show(max: 100, msg: 'Espere un momento');
    isEnable = false;

    User myUser = new User(
        id: user.id,
        name: name,
        lastname: lastname,
        phone: phone,
    );

    Stream stream = await usersProvider.update(myUser, imageFile);
    stream.listen((res) {

      _progressDialog.close();

      ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
      print('Respuesta: ${responseApi.toJson()}');
      Fluttertoast.showToast(msg: responseApi.message);

      if(responseApi.success){
        Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
      }
      else{
        isEnable = true;
      }
    });

  }

  Future selectImage(ImageSource imageSource) async{
    xFile = await ImagePicker().pickImage(source: imageSource);
    if(xFile != null){
      imageFile = File(xFile.path);
    }
    Navigator.pop(context);
    refresh();
  }

  void showAlertDialog(){
    Widget galleryButton = ElevatedButton(
        onPressed: (){
          selectImage(ImageSource.gallery);
        },
        child: Text('GALERIA')
    );

    Widget cameraButton = ElevatedButton(
        onPressed: (){
          selectImage(ImageSource.camera);
        },
        child: Text('GALERIA')
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona tu imagen'),
      actions: [
        galleryButton,
        cameraButton
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }

  void  goToLoginPage(){
    Navigator.pushNamed(context, 'login');
  }
}