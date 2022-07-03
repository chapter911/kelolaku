import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolaku/page/detailtransaksipage.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  final TextEditingController _cari = TextEditingController();

  List<Widget> _result = [];
  int lokasi = 0;

  @override
  void initState() {
    super.initState();
    getResult();
  }

  void getResult() {
    _result = [];
    for (int i = 0; i < 10; i++) {
      _result.add(
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Get.to(() => const DetailTransaksi(), arguments: ["201893A"]);
            },
            child: Card(
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "index $lokasi",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      "Pesanan 201893A",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      "Panji Raditya Herdiono",
                    ),
                    const Text(
                      "081234567890",
                    ),
                    const Text(
                      "12 Juni 2022 | 16:00",
                    ),
                    const Text(
                      "Rp. 200.000,-",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.teal,
          width: double.maxFinite,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Transaksi Minggu Ini",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          "Pengeluaran",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Rp. 125.000.000,-",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          "Pengeluaran",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Rp. 125.000.000,-",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: TextField(
                  controller: _cari,
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.find_in_page),
                      labelText: "Cari Pesanan",
                      prefixStyle: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.w600),
                      fillColor: Colors.white),
                  onEditingComplete: () {
                    Get.snackbar("Hai", "Halo");
                  },
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Scrollbar(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ToggleSwitch(
                customWidths: const [100, 100, 100, 100, 100],
                initialLabelIndex: lokasi,
                totalSwitches: 5,
                activeBgColor: const [Colors.teal],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.grey[900],
                labels: const [
                  'Pesanan',
                  'DiKirim',
                  'DiTerima',
                  'DiBatalkan',
                  'Kas'
                ],
                onToggle: (index) {
                  setState(() {
                    lokasi = index!;
                    getResult();
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Flexible(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(children: _result),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Buat Kas Baru"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Buat Pesanan Baru"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
