import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolaku/page/kategoripage.dart';
import 'package:kelolaku/page/produkpage.dart';

class KasirPage extends StatefulWidget {
  const KasirPage({Key? key}) : super(key: key);

  @override
  State<KasirPage> createState() => _KasirPageState();
}

class _KasirPageState extends State<KasirPage> {
  int tab = 0;
  final TextEditingController _cariproduk = TextEditingController();
  final TextEditingController _carikategori = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kelola Inventori"),
          backgroundColor: Colors.teal,
          bottom: TabBar(
              onTap: (index) {
                setState(() {
                  tab = index;
                });
              },
              tabs: const [
                Tab(
                  text: "Produk",
                ),
                Tab(text: "Kategori")
              ]),
        ),
        body: TabBarView(children: [_produk(), _kategori()]),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              if (tab == 0) {
                Get.to(() => const ProdukPage());
              } else {
                Get.to(() => const KategoriPage());
              }
            }),
      ),
    );
  }

  Widget _produk() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _cariproduk,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              labelText: "Cari Produk",
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
          SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/image/promo1.png',
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Celana Jenas Elvis Presvile"),
                        const Text("Jeans"),
                        const Text("Rp. 50.000"),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Container(
                                      color: Colors.teal,
                                      padding: const EdgeInsets.all(10),
                                      child: const Center(
                                        child: Text(
                                          "Hapus Produk?",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    titlePadding: const EdgeInsets.all(0),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Batal"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red[900]),
                                        child: const Text("Hapus"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red[900]),
                              child: const Text("Hapus"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orange[900]),
                              child: const Text("Edit"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _kategori() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _carikategori,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              labelText: "Cari Kategori",
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
          SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.category,
                        color: Colors.teal,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Apparels",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Container(
                                        color: Colors.teal,
                                        padding: const EdgeInsets.all(10),
                                        child: const Center(
                                          child: Text(
                                            "Hapus Kategori?",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      titlePadding: const EdgeInsets.all(0),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("Batal"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.red[900]),
                                          child: const Text("Hapus"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: Colors.red[900],
                                ),
                                child: const Icon(Icons.delete),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  primary: Colors.orange[900],
                                ),
                                child: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
