import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/component/costumTextStyle.dart';
import 'package:mobile_test/component/general-funct.dart';
import 'package:mobile_test/component/global-vars.dart';
import 'package:mobile_test/component/warna.dart';
import 'package:mobile_test/main/sideMenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late String namaOutlet;

  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);

    namaOutlet = GlobalVars.DATAOUTLET == null
        ? "...."
        : GlobalVars.DATAOUTLET['outlet_name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.primary,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: FloatingActionButton(
          child: GeneralFunct.callSvg("Union7.svg", 24, Warna.primary),
          onPressed: () {},
          backgroundColor: Colors.white),
      body: SafeArea(
          child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       decoration: const BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.only(
          //             bottomLeft: Radius.circular(30.0),
          //             bottomRight: Radius.circular(30.0)),
          //       ),
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          //       // margin: EdgeInsets.symmetric(v)
          //       // alignment: Alignment.center,
          //       child: GeneralFunct.callSvg("Union7.svg", 24, Warna.primary),
          //     ),
          //   ],
          // ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.white),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(namaOutlet,
                            style: CostumTextStyle.textFormFieldRegularMedium),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.money_sharp,
                                    color: Warna.primary,
                                  ),
                                  Text(
                                    "IDR",
                                    style: CostumTextStyle.textFormFieldRegular
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              Text("IDR",
                                  style: CostumTextStyle.textFormFieldRegular),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.money_sharp,
                                    color: Warna.primary,
                                  ),
                                  Text(
                                    "IDR",
                                    style: CostumTextStyle.textFormFieldRegular
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              Text("IDR",
                                  style: CostumTextStyle.textFormFieldRegular),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.money_sharp,
                                    color: Warna.primary,
                                  ),
                                  Text(
                                    "IDR",
                                    style: CostumTextStyle.textFormFieldRegular
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              Text("IDR",
                                  style: CostumTextStyle.textFormFieldRegular),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.money_sharp,
                                    color: Warna.primary,
                                  ),
                                  Text(
                                    "IDR",
                                    style: CostumTextStyle.textFormFieldRegular
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                              Text("IDR",
                                  style: CostumTextStyle.textFormFieldRegular),
                            ],
                          ),
                        ),
                      ]),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Warna.primaty2),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DottedBorder(
                          color: Color(0xff3A9D44),
                          strokeWidth: 1,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            // decoration: BoxDecoration(border: Border.all(color: Color(0xff3A9D44), width: 1, style: BorderStyle.)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => SideMenuPage()));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          child: GeneralFunct.callSvg(
                                              "Union.svg", 18, Warna.primary),
                                        ),
                                        Container(
                                            child: Text(
                                          "Masuk",
                                          style: CostumTextStyle
                                              .textFormFieldRegular
                                              .copyWith(fontSize: 8),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: GeneralFunct.callSvg(
                                            "Union(1).svg", 18, Warna.primary),
                                      ),
                                      Container(
                                          child: Text(
                                        "Keluar",
                                        style: CostumTextStyle
                                            .textFormFieldRegular
                                            .copyWith(fontSize: 8),
                                      )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: GeneralFunct.callSvg(
                                            "Union(2).svg", 18, Warna.primary),
                                      ),
                                      Container(
                                          child: Text(
                                        "Pindah",
                                        style: CostumTextStyle
                                            .textFormFieldRegular
                                            .copyWith(fontSize: 8),
                                      )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: GeneralFunct.callSvg(
                                            "Union(3).svg", 18, Warna.primary),
                                      ),
                                      Container(
                                          child: Text(
                                        "Mutasi",
                                        style: CostumTextStyle
                                            .textFormFieldRegular
                                            .copyWith(fontSize: 8),
                                      )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: GeneralFunct.callSvg(
                                            "Union(4).svg", 18, Warna.primary),
                                      ),
                                      Container(
                                          child: Text(
                                        "Kurs",
                                        style: CostumTextStyle
                                            .textFormFieldRegular
                                            .copyWith(fontSize: 8),
                                      )),
                                    ],
                                  )
                                ]),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
