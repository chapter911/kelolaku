import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolaku/page/registerpage.dart';
import 'package:kelolaku/page/shopregisterpage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final RoundedLoadingButtonController _login =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icon/app_logo.png'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Selamat Datang,\nSilahkan Masuk Terlebih Dahulu",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: "username",
                    prefixStyle: const TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.vpn_key),
                    labelText: "password",
                    prefixStyle: const TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedLoadingButton(
                  controller: _login,
                  color: Colors.teal,
                  onPressed: () {
                    setState(() {
                      _login.reset();
                      Get.to(() => const ShopRegister(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(seconds: 1));
                    });
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => const RegisterPage(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(seconds: 1),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                      children: [
                        TextSpan(text: "Tidak Punya Akun?"),
                        TextSpan(
                          text: " Register",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
