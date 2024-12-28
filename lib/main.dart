import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Hesaplama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _vizeController = TextEditingController();
  final TextEditingController _finalController = TextEditingController();
  String _ortalama = "";

  void _hesapla() {
    final double vize = double.tryParse(_vizeController.text) ?? 0;
    final double finalNotu = double.tryParse(_finalController.text) ?? 0;

    if (vize >= 0 && finalNotu >= 0) {
      final double ortalama = (vize * 0.4) + (finalNotu * 0.6);
      setState(() {
        _ortalama = "Ortalama: ${ortalama.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        _ortalama = "Lütfen geçerli notlar giriniz!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Hesaplama Uygulaması'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _vizeController,
              decoration: const InputDecoration(
                labelText: 'Vize Notu',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _finalController,
              decoration: const InputDecoration(
                labelText: 'Final Notu',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hesapla,
              child: const Text('Ortalama Hesapla'),
            ),
            const SizedBox(height: 16),
            Text(
              _ortalama,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
