import 'package:flutter/material.dart';
import 'package:flutter_e_shop/api_helper/getApiData.dart';
import 'package:flutter_e_shop/model/product_data.dart';

class ProviderClass extends ChangeNotifier {
  product_data? post;
  bool loading = true;
  List<product_data>? prodectList = [];

  void getData() async {
    //loading = false;
    prodectList = await ApiService().getUsers();
    loading = false;
    notifyListeners();
  }

  getPostData() async {
    post = await ApiService().getProducts();
    notifyListeners();
  }

  //   //DataModel? post;
  // List<DataModel>? userInfoList = [];
  // bool loading = false;

  // getPostData() async {
  //   loading = true;
  //   //post = (await getData());
  //   loading = false;
  //   notifyListeners();
  // }
}
