import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im_stepper/stepper.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ShopRegister extends StatefulWidget {
  const ShopRegister({Key? key}) : super(key: key);

  @override
  State<ShopRegister> createState() => _ShopRegisterState();
}

class _ShopRegisterState extends State<ShopRegister> {
  int beginpage = 0, maxpage = 3;
  late Widget _tampilan;
  final RoundedLoadingButtonController _nextbutton =
      RoundedLoadingButtonController();
  final TextEditingController _namatoko = TextEditingController();
  final TextEditingController _nomorkontak = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _deskripsi = TextEditingController();

  @override
  void initState() {
    super.initState();
    halaman();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              // _tampilan,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pilih Hari Buka",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Text(
                    "Bisa Pilih lebih dari satu",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("SENIN"),
                      ),
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DotStepper(
                  dotCount: maxpage,
                  dotRadius: 12,
                  shape: Shape.stadium,
                  spacing: 10,
                  indicatorDecoration:
                      const IndicatorDecoration(color: Colors.teal),
                  indicator: Indicator.shift,
                  activeStep: beginpage,
                  onDotTapped: (tappedDotIndex) {
                    setState(() {
                      beginpage = tappedDotIndex;
                      halaman();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void halaman() {
    if (beginpage == 0) {
      _tampilan = Column(
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
              prefixStyle:
                  TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
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
          RoundedLoadingButton(
            controller: _nextbutton,
            color: Colors.teal,
            onPressed: () {
              setState(() {
                _nextbutton.reset();
                beginpage++;
                halaman();
              });
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      );
    } else if (beginpage == 1) {
      _tampilan = Column(
        children: [
          Center(
            child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.teal,
              padding: const EdgeInsets.all(15.0),
              child: const Icon(
                Icons.camera_alt,
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
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
              prefixStyle:
                  TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
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
                prefixStyle:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
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
              prefixStyle:
                  TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
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
          Row(
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        beginpage--;
                        halaman();
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: const Text("Kembali"),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Selanjutnya"),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    } else if (beginpage == 2) {
      _tampilan = const Text("CCCC");
    }
  }
}
