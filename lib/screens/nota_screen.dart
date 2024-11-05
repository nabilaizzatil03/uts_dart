import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class NotaScreen extends StatelessWidget {
  final int totalHarga;
  final int jumlahBayar;
  final int kembalian;

  NotaScreen({required this.totalHarga, required this.jumlahBayar, required this.kembalian});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nota Pembayaran')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Pembelian: Rp $totalHarga'),
            Text('Jumlah Pembayaran: Rp $jumlahBayar'),
            Text('Kembalian: Rp $kembalian'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Kembali ke Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
