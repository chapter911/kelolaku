import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';

class APIUser {
  String? username, password, phone, createddate, status, apimessage;

  APIUser(
      {this.username,
      this.password,
      this.phone,
      this.createddate,
      this.status,
      this.apimessage});

  factory APIUser.hasilData(Map<String, dynamic> object) {
    return APIUser(
        username: object['username'],
        password: object['password'],
        phone: object['phone'],
        createddate: object['createddate'],
        status: object['status'],
        apimessage: object['apimessage']);
  }

  static Future<List<APIUser>> login(
      context, String username, String password) async {
    List<APIUser> hasilData = [];
    Response response;
    String apiURL = "http://kelolaku.agungj.com/User/Login/$username/$password";

    try {
      BaseOptions options = BaseOptions(
        baseUrl: apiURL,
        connectTimeout: 60000,
        receiveTimeout: 30000,
      );

      Dio dio = Dio(options);

      response = await dio.get(apiURL);

      if (response.statusCode == 200) {
        dynamic listData = response.data;
        for (int i = 0; i < listData.length; i++) {
          hasilData.add(APIUser.hasilData(listData[i]));
        }
        return hasilData;
      } else {
        getx.Get.snackbar("Maaf", "Koneksi Bermasalah",
            backgroundColor: Colors.yellow);
        return hasilData;
      }
    } catch (e) {
      getx.Get.snackbar("Maaf", e.toString(), backgroundColor: Colors.yellow);
      return hasilData;
    }
  }

  static Future<List<APIUser>> insertUser(context, var data) async {
    List<APIUser> hasilData = [];
    Response response;
    String apiURL = "http://kelolaku.agungj.com/User/insertUser";

    try {
      BaseOptions options = BaseOptions(
        baseUrl: apiURL,
        connectTimeout: 60000,
        receiveTimeout: 30000,
      );

      Dio dio = Dio(options);

      response = await dio.post(apiURL, data: data);

      if (response.statusCode == 200) {
        dynamic listData = response.data;
        for (int i = 0; i < listData.length; i++) {
          hasilData.add(APIUser.hasilData(listData[i]));
        }
        return hasilData;
      } else {
        getx.Get.snackbar("Maaf", "Koneksi Bermasalah",
            backgroundColor: Colors.yellow);
        return hasilData;
      }
    } catch (e) {
      getx.Get.snackbar("Maaf", e.toString(), backgroundColor: Colors.yellow);
      return hasilData;
    }
  }
}
