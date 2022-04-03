import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_test/component/constant.dart';
import 'package:intl/intl.dart';

class GeneralFunct {
  static callSvg(String nama, double width, color) {
    return SvgPicture.asset(
      Constant.IMAGE_ASSET + nama,
      width: width,
      fit: BoxFit.scaleDown,
      color: color,
    );
  }

  static formatTanggal(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}
