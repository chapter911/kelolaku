import 'package:flutter/material.dart';

class KasirPage extends StatefulWidget {
  const KasirPage({Key? key}) : super(key: key);

  @override
  State<KasirPage> createState() => _KasirPageState();
}

class _KasirPageState extends State<KasirPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Halaman Kasir"),
    );
  }
}
