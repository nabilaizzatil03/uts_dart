import 'package:flutter/material.dart';
import 'payment_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> produkList = [
    {"nama": "Blangkon Motif Kumitir", "harga": 50000, "keterangan": "Blangkon Jawa Jogja Mataram Kumitir", "image": "assets/produk1.jpg"},
    {"nama": "Blangkon Mataram", "harga": 99000, "keterangan": "Blangkon Mataram Iket Modang Prodo", "image": "assets/produk2.jpg"},
    {"nama": "Blangkon Motif Kemiter", "harga": 100000, "keterangan": "Blangkon Jogja", "image": "assets/produk3.jpg"},
    {"nama": "Blangkon Mataram Premium", "harga": 256000, "keterangan": "Blangkon mataram premium motif poleng kawitran", "image": "assets/produk3.jpg"},
  ];

  int totalHarga = 0;

  void _tambahKeKeranjang(int harga) {
    setState(() {
      totalHarga += harga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard Produk')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          childAspectRatio: 0.8, // Aspect ratio to adjust height/width
        ),
        itemCount: produkList.length,
        itemBuilder: (context, index) {
          final produk = produkList[index];
          return Card(
            color: Colors.grey[900],
            child: InkWell(
              onTap: () => _tambahKeKeranjang(produk["harga"]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(produk["image"], width: 100, height: 100), // Increase size
                  SizedBox(height: 10),
                  Text(produk["nama"], style: TextStyle(color: Colors.white, fontSize: 18)), // Increase font size
                  SizedBox(height: 5),
                  Text(produk["keterangan"], style: TextStyle(color: Colors.white70, fontSize: 14)), // Increase font size
                  SizedBox(height: 5),
                  Text("Rp ${produk["harga"]}", style: TextStyle(color: Colors.white, fontSize: 16)), // Increase font size
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentScreen(totalHarga: totalHarga),
              ),
            );
          },
          child: Text("Lanjut ke Pembayaran - Total: Rp $totalHarga", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
