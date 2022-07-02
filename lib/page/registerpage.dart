import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolaku/page/loginpage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _notelp = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _konfirmasi = TextEditingController();

  final RoundedLoadingButtonController _register =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icon/app_logo.png',
                scale: 3,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Daftar Kelolaku",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.start,
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
                controller: _notelp,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android),
                  labelText: "Nomor Telefon",
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
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.vpn_key),
                  labelText: "Password",
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
                controller: _konfirmasi,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.vpn_key),
                  labelText: "Konfirmasi Password",
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
                controller: _register,
                width: double.maxFinite,
                onPressed: () {
                  setState(() {
                    _register.reset();
                  });
                },
                color: Colors.teal,
                child: const Text("REGISTER"),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.offAll(
                      () => const LoginPage(),
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
                        TextSpan(text: "Sudah Punya Akun?"),
                        TextSpan(
                          text: " Login",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
