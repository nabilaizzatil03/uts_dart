import 'package:flutter/material.dart';
import 'nota_screen.dart';

class PaymentScreen extends StatefulWidget {
  final int totalHarga;

  PaymentScreen({required this.totalHarga});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _jumlahBayarController = TextEditingController();
  int kembalian = 0;

  void _hitungKembalian() {
    int jumlahBayar = int.tryParse(_jumlahBayarController.text) ?? 0;
    setState(() {
      kembalian = jumlahBayar - widget.totalHarga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pembayaran')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Total yang harus dibayarkan: Rp ${widget.totalHarga}'),
            TextField(
              controller: _jumlahBayarController,
              decoration: InputDecoration(labelText: 'Jumlah Pembayaran'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _hitungKembalian();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotaScreen(
                      totalHarga: widget.totalHarga,
                      jumlahBayar: int.tryParse(_jumlahBayarController.text) ?? 0,
                      kembalian: kembalian,
                    ),
                  ),
                );
              },
              child: Text('Bayar'),
            ),
          ],
        ),
      ),
    );
  }
}
