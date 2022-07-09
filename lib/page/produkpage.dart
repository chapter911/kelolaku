import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kelolaku/page/variasiproduk.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

enum Varian { Ya, Tidak }

class _ProdukPageState extends State<ProdukPage> {
  final TextEditingController _namaproduk = TextEditingController();
  final TextEditingController _deskripsiproduk = TextEditingController();
  final TextEditingController _harga = TextEditingController();
  final TextEditingController _berat = TextEditingController();

  Varian? _varian = Varian.Ya;
  bool _showvarian = true,
      variasi1 = false,
      variasi2 = false,
      variasi3 = false,
      variasi4 = false,
      stock = false,
      sembunyikan = false;

  String kategori = '- PILIH -';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buat Produk"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nama Kategori",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _namaproduk,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.title),
                hintText: "Nama Produk",
                prefixStyle: const TextStyle(
                    color: Colors.teal, fontWeight: FontWeight.w600),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Deskripsi Produk",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _deskripsiproduk,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.title),
                hintText: "Deskripsi Produk",
                prefixStyle: const TextStyle(
                    color: Colors.teal, fontWeight: FontWeight.w600),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Pilih Kategori",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 0.80),
              ),
              child: DropdownButton(
                isExpanded: true,
                value: kategori,
                items: <String>['- PILIH -', 'Apparels', 'Jeans']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Unggah Gambar Produk (Maksimal Tiga)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Harga Produk",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _harga,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.money),
                hintText: "Harga Produk",
                prefixStyle: const TextStyle(
                    color: Colors.teal, fontWeight: FontWeight.w600),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Berat Produk (Gram)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _berat,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.money),
                hintText: "Berat Produk (Gram)",
                prefixStyle: const TextStyle(
                    color: Colors.teal, fontWeight: FontWeight.w600),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Produk Mempunyai Varian",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Ya'),
                    leading: Radio<Varian>(
                      value: Varian.Ya,
                      groupValue: _varian,
                      onChanged: (Varian? value) {
                        setState(() {
                          _varian = value;
                          _showvarian = true;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Tidak'),
                    leading: Radio<Varian>(
                      value: Varian.Tidak,
                      groupValue: _varian,
                      onChanged: (Varian? value) {
                        setState(() {
                          _varian = value;
                          _showvarian = false;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: _showvarian,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Variasi Produk"),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const VariasiProduk());
                            },
                            child: const Text("Ubah"),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          variasi1 = !variasi1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.black, width: 1),
                          primary: variasi1 ? Colors.teal : Colors.white),
                      child: Text(
                        "Panda Lima Ratus Merah dengan Long Sleeve",
                        style: TextStyle(
                            color: variasi1 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          variasi2 = !variasi2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.black, width: 1),
                          primary: variasi2 ? Colors.teal : Colors.white),
                      child: Text(
                        "XL",
                        style: TextStyle(
                            color: variasi2 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          variasi3 = !variasi3;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.black, width: 1),
                          primary: variasi3 ? Colors.teal : Colors.white),
                      child: Text(
                        "XXL",
                        style: TextStyle(
                            color: variasi3 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          variasi4 = !variasi4;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(color: Colors.black, width: 1),
                          primary: variasi4 ? Colors.teal : Colors.white),
                      child: Text(
                        "XL Logo Custom",
                        style: TextStyle(
                            color: variasi4 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text("STOCK"),
                      Switch(
                        value: stock,
                        onChanged: (value) {
                          setState(() {
                            stock = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text("Sembunyikan Produk"),
                      Switch(
                        value: sembunyikan,
                        onChanged: (value) {
                          setState(() {
                            sembunyikan = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
