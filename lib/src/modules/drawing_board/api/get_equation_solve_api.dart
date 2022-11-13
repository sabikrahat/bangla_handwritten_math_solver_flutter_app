import 'dart:convert';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../../../helpers/constants/constants.dart';
import '../../../utils/logger/logger_helper.dart';
import '../models/solve_result.dart';

Future<bool> checkConnection() async {
  try {
    var request = http.Request('GET', Uri.parse('$baseLink/'));
    request.body = '''''';
    http.StreamedResponse response = await request.send();

    var body = await response.stream.bytesToString();
    log.i('>>> Check connection API response: $body');
    SolveResult solveResult = solveResultFromJson(body);

    return solveResult.success;
  } on SocketException catch (_) {
    return false;
  } catch (_) {
    return false;
  }
}

Future<String> getEquationSolveApi(String imgEqu, String imgAns) async {
  try {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$baseLink/equation_solve/'));
    request.body = json.encode({"img_equ": imgEqu, "img_ans": imgAns});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var body = await response.stream.bytesToString();
    log.i('>>> Equation solve API response: $body');
    SolveResult solveResult = solveResultFromJson(body);

    if (solveResult.success) {
      EasyLoading.dismiss();
      return solveResult.result ?? '';
    } else {
      EasyLoading.showError(solveResult.message);
      return solveResult.message;
    }
  } on SocketException catch (e) {
    EasyLoading.showError('No Internet Connection. $e');
    return e.message;
  } catch (e) {
    EasyLoading.showError(e.toString());
    return e.toString();
  }
}
