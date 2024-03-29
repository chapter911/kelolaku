import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelolaku/api/apishop.dart';
import 'package:kelolaku/model/data_sharedpreferences.dart';
import 'package:kelolaku/page/mainpage.dart';

class ShopRegister extends StatefulWidget {
  const ShopRegister({Key? key}) : super(key: key);

  @override
  State<ShopRegister> createState() => _ShopRegisterState();
}

class _ShopRegisterState extends State<ShopRegister> {
  final TextEditingController _namatoko = TextEditingController();
  final TextEditingController _nomorkontak = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _deskripsi = TextEditingController();
  final TextEditingController _jambuka = TextEditingController();
  final TextEditingController _jamtutup = TextEditingController();
  final TextEditingController _informasi = TextEditingController();

  bool senin = false,
      selasa = false,
      rabu = false,
      kamis = false,
      jumat = false,
      sabtu = false,
      minggu = false;

  int _currenStep = 0;

  String username = "";

  var _image;
  var imagePicker;
  var type;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    DataSharedPreferences().readString("username").then((value) {
      username = value!;
    });
  }

  List<Step> getStep() => [
        Step(
            isActive: _currenStep >= 0,
            title: const Text("Nama"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/image/people.png',
                    scale: 2,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Selamat Bergabung!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Kembangkan Tokomu lebih cepat dan mudah lihat perkembangan tokomu dan pahami pembeli, semua dalam satu aplikasi!",
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _namatoko,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.shopping_bag_outlined),
                    labelText: "Nama Toko",
                    prefixStyle: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
        Step(
          isActive: _currenStep >= 1,
          title: const Text("Deskripsi"),
          content: Column(
            children: [
              Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        XFile image = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          _image = File(image.path);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        primary: Colors.teal,
                        onPrimary: Colors.red,
                      ),
                      child: _image != null
                          ? Image.file(
                              _image,
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.fitHeight,
                            )
                          : const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 50,
                            ))),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  XFile image = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 50,
                      preferredCameraDevice: CameraDevice.front);
                  setState(() {
                    _image = File(image.path);
                  });
                },
                child: const Text("Pilih Gambar untuk Toko"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _nomorkontak,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Nomor Telefon",
                  prefixStyle: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: TextField(
                  controller: _alamat,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.pin_drop),
                    labelText: "Alamat",
                    prefixStyle: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _deskripsi,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  labelText: "Deskripsi Toko",
                  prefixStyle: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Step(
          isActive: _currenStep >= 2,
          title: const Text("Info"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pilih Hari Buka",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "Bisa Pilih lebih dari satu",
              ),
              const SizedBox(
                height: 30,
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        senin = !senin;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        primary: senin ? Colors.teal : Colors.white),
                    child: Text(
                      "Senin",
                      style:
                          TextStyle(color: senin ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selasa = !selasa;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        primary: selasa ? Colors.teal : Colors.white),
                    child: Text(
                      "Selasa",
                      style: TextStyle(
                          color: selasa ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rabu = !rabu;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        primary: rabu ? Colors.teal : Colors.white),
                    child: Text(
                      "Rabu",
                      style:
                          TextStyle(color: rabu ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        kamis = !kamis;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        primary: kamis ? Colors.teal : Colors.white),
                    child: Text(
                      "Kamis",
                      style:
                          TextStyle(color: kamis ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        jumat = !jumat;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        primary: jumat ? Colors.teal : Colors.white),
                    child: Text(
                      "Jum'at",
                      style:
                          TextStyle(color: jumat ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sabtu = !sabtu;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        primary: sabtu ? Colors.teal : Colors.white),
                    child: Text(
                      "Sabtu",
                      style:
                          TextStyle(color: sabtu ? Colors.white : Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        minggu = !minggu;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        primary: minggu ? Colors.teal : Colors.white),
                    child: Text(
                      "Minggu",
                      style: TextStyle(
                          color: minggu ? Colors.white : Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _jambuka,
                      readOnly: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.watch_later_outlined),
                        labelText: "Jam Buka",
                      ),
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            _jambuka.text = "${value.hour} : ${value.minute}";
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _jamtutup,
                      readOnly: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.watch_later_outlined),
                        labelText: "Jam Tutup",
                      ),
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            _jamtutup.text = "${value.hour} : ${value.minute}";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _informasi,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.note),
                  labelText: "Informasi Tambahan",
                  prefixStyle: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.w600),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stepper(
          currentStep: _currenStep,
          type: StepperType.horizontal,
          steps: getStep(),
          onStepContinue: () {
            if (_currenStep < getStep().length) {
              setState(() {
                _currenStep++;
              });
            }
          },
          onStepCancel: () {
            if (_currenStep > 0) {
              setState(() {
                _currenStep--;
              });
            }
          },
          onStepTapped: (step) => setState(() {
            _currenStep = step;
          }),
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  if (_currenStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controls.onStepCancel,
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        child: const Text("KEMBALI"),
                      ),
                    ),
                  if (_currenStep != 0)
                    const SizedBox(
                      width: 10,
                    ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _currenStep != getStep().length - 1
                          ? controls.onStepContinue
                          : () {
                              registerShop();
                            },
                      child: Text(_currenStep != 2 ? "LANJUT" : "BUAT TOKO"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void registerShop() async {
    if (_namatoko.text.isEmpty ||
        _nomorkontak.text.isEmpty ||
        _alamat.text.isEmpty ||
        _deskripsi.text.isEmpty ||
        _jambuka.text.isEmpty ||
        _jamtutup.text.isEmpty ||
        _informasi.text.isEmpty) {
      Get.snackbar("Maaf", "Harap Lengkapi Data Anda");
    } else {
      File file = _image;
      String fileName = file.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        "foto": await dio.MultipartFile.fromFile(file.path, filename: fileName),
        "nama": _namatoko.text,
        "phone": _nomorkontak.text,
        "alamat": _alamat.text,
        "deskripsi": _deskripsi.text,
        "senin": senin ? "1" : "0",
        "selasa": selasa ? "1" : "0",
        "rabu": rabu ? "1" : "0",
        "kamis": kamis ? "1" : "0",
        "jumat": jumat ? "1" : "0",
        "sabtu": sabtu ? "1" : "0",
        "minggu": minggu ? "1" : "0",
        "jambuka": _jambuka.text,
        "jamtutup": _jamtutup.text,
        "informasitambahan": _informasi.text,
        "username": username,
      });

      APIShop.insertShop(context, formData).then((value) {
        if (value.isNotEmpty) {
          Get.snackbar("Informasi", value[0].apimessage!);
          if (value[0].status == "success") {
            Get.offAll(() => const MainPage());
          }
        }
      });
    }
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);
