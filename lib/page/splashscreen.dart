import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolaku/model/data_sharedpreferences.dart';
import 'package:kelolaku/page/mainpage.dart';
import 'package:kelolaku/page/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    DataSharedPreferences().checkData("username").then((value) {
      if (value) {
        Future.delayed(const Duration(seconds: 1)).then((value) {
          Get.offAll(() => const MainPage(),
              transition: Transition.downToUp,
              duration: const Duration(seconds: 2));
        });
      } else {
        Future.delayed(const Duration(seconds: 1)).then((value) {
          Get.offAll(() => const LoginPage(),
              transition: Transition.downToUp,
              duration: const Duration(seconds: 2));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Image.asset('assets/image/opening.png'),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(50),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/image/fulllogo.png'),
                    const Text(
                      "KELOLA TOKO LEBIH MUDAH DALAM SATU APLIKASI",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
