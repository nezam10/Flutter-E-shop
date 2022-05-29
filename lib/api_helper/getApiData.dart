import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/product_data.dart';
import '../utils/constants.dart';

class ApiService {
  Future<product_data> getProducts() async {
    product_data? result;
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.endUrl),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    final item = jsonDecode(response.body);
    //print(item);
    result = product_data.fromJson(item);
    print("test${result.toString()}");
    return result;
  }

  Future<List<product_data>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        print("asdf" + item.toString());
        List<product_data> userList = userModelFromJson(response.body);
        return userList;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
