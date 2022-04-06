import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_test/component/global-vars.dart';

class Service {
  Future<dynamic> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("http://test-tech.api.jtisrv.com/md/public/API/Auth"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'act': "LOGIN",
        'un': username,
        'up': password,
      }),
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Gagal Upload Data');
    }
  }

  Future<dynamic> initData() async {
    final response = await http.post(
      Uri.parse("http://test-tech.api.jtisrv.com/md/public/API/Auth/initData"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'act': "initData",
        'outlet_id': GlobalVars.DATAUSER["outlet_id"],
      }),
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Gagal Upload Data');
    }
  }

  Future<dynamic> trx_get_data(String trx_id) async {
    final response = await http.post(
      Uri.parse("http://test-tech.api.jtisrv.com/md/public/API/Trx/Get"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "act": "trxGet",
        "outlet_id": GlobalVars.DATAUSER['outlet_id'],
        "user_id": GlobalVars.DATAUSER['user_id'],
        "data": {
          "trx_id": trx_id,
          "status": "1",
          "date_start": "",
          "date_end": ""
        }
      }),
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Gagal Upload Data');
    }
  }

  Future<dynamic> trx_add_data(
      String pTipe,
      String curr_id,
      String nominal,
      String ket,
      // File photo,
      String outlet_id1,
      String outlet_id2,
      String tgl) async {
    final response = await http.post(
      Uri.parse("http://test-tech.api.jtisrv.com/md/public/API/Trx/Add"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "act": "trxAdd",
        "outlet_id": GlobalVars.DATAUSER['outlet_id'],
        "user_id": GlobalVars.DATAUSER['user_id'],
        "data": {
          "ptipe": pTipe,
          "curr_id": curr_id,
          "nominal": nominal,
          "ket": ket,
          "photo": "photo",
          "outlet_id1": outlet_id1,
          "outlet_id2": outlet_id2,
          "tgl": tgl
        }
      }),
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Gagal Upload Data');
    }
  }

  Future<dynamic> trx_del_data(String trx_id) async {
    final response = await http.post(
      Uri.parse("http://test-tech.api.jtisrv.com/md/public/API/Trx/Del"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "act": "trxDel",
        "outlet_id": GlobalVars.DATAUSER['outlet_id'],
        "user_id": GlobalVars.DATAUSER['user_id'],
        "data": {"trx_id": trx_id}
      }),
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Gagal Upload Data');
    }
  }
}
