import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:mobile_test/component/costumTextStyle.dart';
import 'package:mobile_test/component/general-funct.dart';
import 'package:mobile_test/component/global-vars.dart';
import 'package:mobile_test/component/warna.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({Key? key}) : super(key: key);

  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  late String dropdownValue = 'Android';
  TextEditingController cNominal = TextEditingController();
  TextEditingController cKet = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  late List<dynamic> xx = [];
  String setTanggal = new DateTime.now().toString();

  @override
  void initState() {
    super.initState();
    cNominal = TextEditingController(text: "0");
    xx.addAll(GlobalVars.DATAOUTLET_SUB_LIST);
    print(xx);
    setState(() {
      dropdownValue = xx[0]['outlet_name'];
    });
  }

  showPickerDate(BuildContext context) {
    Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(),
        title: Text("Pilih Tanggal"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
          setState(() {
            setTanggal =
                (picker.adapter as DateTimePickerAdapter).value.toString();
          });
        }).showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(Icons.arrow_back_ios_new_sharp, color: Warna.primary),
            )),
        title: Text(
          "Masuk",
          style:
              CostumTextStyle.textFormFieldRegularMedium.copyWith(fontSize: 14),
        ),
      ),
      backgroundColor: Warna.primary,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 32),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xfff5f5f5)),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButton(
                    alignment: Alignment.center,
                    hint: Text(""),
                    value: dropdownValue,
                    items: xx.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['outlet_name']),
                        value: item['outlet_name'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Form(
              key: _keyForm,
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    showPickerDate(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Center(
                      child: Text(GeneralFunct.formatTanggal(setTanggal),
                          style: CostumTextStyle.textFormFieldRegular
                              .copyWith(fontSize: 14)),
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.symmetric(vertical: 8),
                  // height: ScreenSize.height(context, 100),
                  // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: cNominal,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Tidak Boleh Kosong';
                      }
                      return null;
                    },
                    textAlign: TextAlign.right,
                    // onSaved: (value) =>
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        // hintStyle: CostumeTextStyle.textFormFieldRegular,
                        // prefixText: '0',
                        fillColor: Colors.white,
                        filled: true,
                        // prefixStyle: CostumeTextStyle.textFormFieldRegular,
                        // labelText: "Username",
                        suffixIcon: Icon(
                          Icons.money,
                          color: Warna.primary,
                        ),
                        labelStyle: CostumTextStyle.textFormFieldRegular,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Warna.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ]),
            ),
          )
        ],
      )),
    );
  }
}
