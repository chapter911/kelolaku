import 'package:flutter/material.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  final TextEditingController _namakategori = TextEditingController();
  final TextEditingController _deskripsikategori = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buat Kategori"),
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
              controller: _namakategori,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.title),
                hintText: "Nama kategori",
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
              "Deskripsi Kategori",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _deskripsikategori,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.title),
                hintText: "Deskripsi kategori",
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
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Buat Kategori"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Perbarui Kategori"),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
