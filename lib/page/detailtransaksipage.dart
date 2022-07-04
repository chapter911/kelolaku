import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTransaksi extends StatefulWidget {
  const DetailTransaksi({Key? key}) : super(key: key);

  @override
  State<DetailTransaksi> createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  String status = 'Belum Dibayar';
  List<Widget> _produk = [];

  @override
  void initState() {
    super.initState();
    getProduk();
  }

  void getProduk() {
    _produk = [];
    for (int i = 0; i < 2; i++) {
      _produk.add(
        SizedBox(
          width: double.maxFinite,
          child: Card(
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      'assets/image/promo1.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Jacket Masa Kini",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rp. 35.000,-",
                        ),
                        Text(
                          "100gr",
                        ),
                      ],
                    ),
                  ),
                ],
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  Get.arguments[0],
                  style: const TextStyle(color: Colors.black),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: DropdownButton(
                      value: status,
                      items: <String>['Belum Dibayar', 'Lunas']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.teal),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.teal,
                                child: const Center(
                                  child: Text(
                                    "Ganti Status?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            titlePadding: const EdgeInsets.all(0),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                child: const Text("Batal"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    status = newValue!;
                                  });
                                  Get.back();
                                },
                                child: const Text("Ganti"),
                              ),
                            ],
                          ),
                        );
                      },
                      style: const TextStyle(color: Colors.teal),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Status",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Belum DiTerima",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Tanggal",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "12 Februari 2022",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Produk",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Column(
                children: _produk,
              ),
              const Text(
                "Paket Promo",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.teal),
              ),
              Column(
                children: _produk,
              ),
              const Text(
                "Permintaan Tambahan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Permisi untuk paket bundlenya merek A kalau tersedia",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Informasi Pembeli",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Table(
                          children: const [
                            TableRow(
                              children: [
                                Text("Nama"),
                                Text("Monika Susanti"),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("Nomor Kontak"),
                                Text("08123456xxxx"),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("Alamat"),
                                Text(
                                    "Jalan 12 Banjar  Lampung, nomor 30, Pandaan, Pasuruan, Jawa Timur 19720"),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("Informasi Alamat Tambahan"),
                                Text("Dekat Daerah Pasar Masjid"),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("Pengiriman"),
                                Text("Ambil Sendiri"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Table(
                      children: const [
                        TableRow(
                          children: [
                            Text("Pembayaran"),
                            Text(
                              "Tunai",
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("Total Harga"),
                            Text(
                              "420.000",
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("Promo"),
                            Text(
                              "-20.000",
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text("Ongkos Kirim"),
                            Text("0", textAlign: TextAlign.end),
                          ],
                        ),
                        TableRow(
                          children: [
                            Divider(),
                            Divider(),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Total Pesanan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Rp. 400.000",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: const Text("Pesanan Dikirim"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: Colors.teal),
                      child: const Text("Pesanan DiTerima"),
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  "Batalkan Pesanan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
