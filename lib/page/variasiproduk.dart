import 'package:flutter/material.dart';

class VariasiProduk extends StatefulWidget {
  const VariasiProduk({Key? key}) : super(key: key);

  @override
  State<VariasiProduk> createState() => _VariasiProdukState();
}

class _VariasiProdukState extends State<VariasiProduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Variasi Produk")),
      body: Container(
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
