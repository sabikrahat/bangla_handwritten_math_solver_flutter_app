// To parse this JSON data, do
//
//     final solveResult = solveResultFromJson(jsonString);

import 'dart:convert';

SolveResult solveResultFromJson(String str) =>
    SolveResult.fromJson(json.decode(str));

String solveResultToJson(SolveResult data) => json.encode(data.toJson());

class SolveResult {
  SolveResult({
    this.success = false,
    required this.message,
    required this.result,
  });

  final bool success;
  final String message;
  final String? result;

  SolveResult copyWith({
    bool? success,
    String? message,
    String? result,
  }) =>
      SolveResult(
        success: success ?? this.success,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory SolveResult.fromJson(Map<String, dynamic> json) => SolveResult(
        success: json["success"] ?? false,
        message: json["message"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "result": result,
      };
}
