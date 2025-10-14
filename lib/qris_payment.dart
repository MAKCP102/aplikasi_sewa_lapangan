import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final formatter = NumberFormat.currency(
    locale: 'id_id',
    symbol: 'Rp',
    decimalDigits: 0
);

class QrisPayment extends StatelessWidget {
  final int duration;
  final int totalPrice;
  final int pricePerHour;
  final String courtName;

  const QrisPayment({
    super.key,
    required this.courtName,
    required this.duration,
    required this.totalPrice,
    required this.pricePerHour
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Payment Method", style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black
        )),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Payment Amount", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                )),
              ],
            ), SizedBox(height: 5),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(formatter.format(totalPrice), style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.black,
                ))
              ]
            ), SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset("assets/images/qr.png", height: 200)
                ],
              )
            ), SizedBox(height: 15),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Scan to Pay", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                ))
              ]
            ), SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Point your camera at the QR code", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey[700],
                ))
              ]
            )
          ]
        ),
      ),
    );
  }
}
