import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';

class APIShop {
  String? nama,
      phone,
      alamat,
      deskripsi,
      senin,
      selasa,
      rabu,
      kamis,
      jumat,
      sabtu,
      minggu,
      jambuka,
      jamtutup,
      informasitambahan,
      foto,
      username,
      status,
      apimessage;

  APIShop(
      {this.nama,
      this.phone,
      this.alamat,
      this.deskripsi,
      this.senin,
      this.selasa,
      this.rabu,
      this.kamis,
      this.jumat,
      this.sabtu,
      this.minggu,
      this.jambuka,
      this.jamtutup,
      this.informasitambahan,
      this.foto,
      this.username,
      this.status,
      this.apimessage});

  factory APIShop.hasilData(Map<String, dynamic> object) {
    return APIShop(
        nama: object['nama'],
        phone: object['phone'],
        alamat: object['alamat'],
        deskripsi: object['deskripsi'],
        senin: object['senin'],
        selasa: object['selasa'],
        rabu: object['rabu'],
        kamis: object['kamis'],
        jumat: object['jumat'],
        sabtu: object['sabtu'],
        minggu: object['minggu'],
        jambuka: object['jambuka'],
        jamtutup: object['jamtutup'],
        informasitambahan: object['informasitambahan'],
        foto: object['foto'],
        username: object['username'],
        status: object['status'],
        apimessage: object['apimessage']);
  }

  static Future<List<APIShop>> getShop(context, String username) async {
    List<APIShop> hasilData = [];
    Response response;
    String apiURL = "http://kelolaku.agungj.com/Shop/getShop/$username";

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
          hasilData.add(APIShop.hasilData(listData[i]));
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

  static Future<List<APIShop>> insertShop(context, var data) async {
    List<APIShop> hasilData = [];
    Response response;
    String apiURL = "http://kelolaku.agungj.com/Shop/insertShop";

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
          hasilData.add(APIShop.hasilData(listData[i]));
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
