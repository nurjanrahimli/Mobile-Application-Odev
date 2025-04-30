//Erciyes Üniversitesi Mühendislik Fakültesi Bilgisayar Mühendisliği Mobile App Development dersi Fehim Köylü ListView.builder ile dinamik isim listesi.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'İsim Listesi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IsimListesi(),
    );
  }
}

class IsimListesi extends StatefulWidget {
  const IsimListesi({super.key});

  @override
  State<IsimListesi> createState() => _IsimListesiState();
}

class _IsimListesiState extends State<IsimListesi> {
  final List<String> isimler = [
    'Cavidan',
    'Nurcan',
    'Ayşe',
    'Fatma',
    'Ali',
    'Zeynep',
    'Emre',
    'Selin',
    'Can',
    'Deniz',
    'Ela',
    'Burak',
    'Ceren',
    'Derya',
    'Fırat'
  ];

  final TextEditingController _isimController = TextEditingController();

  void _yeniKisiEkle() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yeni Kişi Ekle'),
        content: TextField(
          controller: _isimController,
          decoration: const InputDecoration(
            hintText: 'İsim giriniz',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _isimController.clear();
            },
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_isimController.text.isNotEmpty) {
                setState(() {
                  isimler.add(_isimController.text);
                });
                Navigator.pop(context);
                _isimController.clear();
              }
            },
            child: const Text('Ekle'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _isimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('İsim Listesi'),
      ),
      body: ListView.builder(
        itemCount: isimler.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.withOpacity(0.2),
                child: Text(
                  isimler[index][0],
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                isimler[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text('${index + 1}. sırada'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.deepPurple.withOpacity(0.6),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _yeniKisiEkle,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
