import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_test/component/costumTextStyle.dart';
import 'package:mobile_test/component/general-funct.dart';
import 'package:mobile_test/component/global-vars.dart';
import 'package:mobile_test/component/warna.dart';
import 'package:mobile_test/main/homePage.dart';
import 'package:mobile_test/service/service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late Future<dynamic> futureInitData;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
  
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: GeneralFunct.callSvg("iconnotif.svg", 22, Warna.primary),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: const Color(0xffC1DDED),
            labelColor: Warna.primary,
            labelStyle: const TextStyle(fontSize: 11),
            tabs: [
              Tab(
                icon: GeneralFunct.callSvg(
                    "iconbuttonhome.svg", 24, Warna.primary),
                text: "Home",
              ),
              Tab(
                icon: GeneralFunct.callSvg(
                    "iconbuttontransaksi.svg", 24, Warna.primary),
                text: "Transaksi",
              ),
              Tab(
                icon: GeneralFunct.callSvg(
                    "iconbuttonlaporan.svg", 24, Warna.primary),
                text: "Laporan",
              ),
              Tab(
                icon: GeneralFunct.callSvg(
                    "iconbuttontools.svg", 24, Warna.primary),
                text: "Tools",
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            'APP KEUANGAN',
            style: CostumTextStyle.textFormFieldRegular.copyWith(fontSize: 14),
          ),
        ),
        body: const TabBarView(
          children: [
            HomePage(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
