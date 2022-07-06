import 'package:flutter/material.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  final TextEditingController _namaproduk = TextEditingController();
  final TextEditingController _deskripsiproduk = TextEditingController();
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
          ],
        ),
      ),
    );
  }
}
