import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/component/costumTextStyle.dart';
import 'package:mobile_test/component/general-funct.dart';
import 'package:mobile_test/component/global-vars.dart';
import 'package:mobile_test/component/warna.dart';
import 'package:mobile_test/main/mainPage.dart';
import 'package:mobile_test/service/service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  late Future<dynamic> futureLogin;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    cUsername = TextEditingController(text: "admin@admin.com");
    cPassword = TextEditingController(text: "admin");
  }

  _login() {
    print("login");
    futureLogin = Service().login(cUsername.text, cPassword.text).then((value) {
      setState(() {
        var data = jsonDecode(value);
        var data_status = data['status'];
        var data_user = data['data']['user'];

        GlobalVars.DATAUSER = data_user;
        if (data_status['error'] == 0 ||
            data_status['error'] == "0" && data_status['login'] == true ||
            data_status['login'] == "true") {
          _getData();
        } else {
          print("Kesalahan");
        }
      });
    }).catchError((err) {
      print(err);
    });
  }

  _getData() async {
    Service().initData().then((value) {
      var data = jsonDecode(value);
      var dataa = data['data'];

      setState(() {
        GlobalVars.DATAOUTLET = dataa['outlet'];
        GlobalVars.DATAOUTLET_SUB_LIST = dataa['outlet_subs'];
        GlobalVars.DATATRX_TIPE_LIST = dataa['trx_tipe'];
        GlobalVars.DATAPAY_TIPE_LIST = dataa['pay_tipe'];
        GlobalVars.DATACUR_TIPE_LIST = dataa['cur_tipe'];
      });
      print(dataa);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainPage()));
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Warna.primary,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // padding: EdgeInsets.symmetric(vertical: 8),
                // height: ScreenSize.height(context, 100),
                // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  controller: cUsername,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Tidak Boleh Kosong';
                    }
                    return null;
                  },
                  // onSaved: (value) =>
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      // hintStyle: CostumeTextStyle.textFormFieldRegular,
                      prefixText: '',
                      fillColor: Colors.white,
                      filled: true,
                      // prefixStyle: CostumeTextStyle.textFormFieldRegular,
                      labelText: "Username",
                      labelStyle: CostumTextStyle.textFormFieldRegular,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Warna.primary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Container(
                // padding: EdgeInsets.symmetric(vertical: 8),
                // height: ScreenSize.height(context, 100),
                margin: EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: cPassword,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Tidak Boleh Kosong';
                    }
                    return null;
                  },
                  // onSaved: (value) =>
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      // hintStyle: CostumeTextStyle.textFormFieldRegular,
                      prefixText: '',
                      fillColor: Colors.white,
                      filled: true,
                      // prefixStyle: CostumeTextStyle.textFormFieldRegular,
                      labelText: "Password",
                      labelStyle: CostumTextStyle.textFormFieldRegular,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Warna.primary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    child: Text(
                      "Login",
                      style: CostumTextStyle.textFormFieldRegular
                          .copyWith(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
