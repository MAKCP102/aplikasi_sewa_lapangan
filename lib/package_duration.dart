import 'package:aplikasi_sewa_lapangan/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final formatter = NumberFormat.currency(
  locale: 'id_id',
  symbol: 'Rp',
  decimalDigits: 0
);

class PackageDuration extends StatefulWidget {
  final String courtName;
  final int price;

  const PackageDuration({
    super.key,
    required this.price,
    required this.courtName});

  @override
  State<PackageDuration> createState() => _PackageDurationState();
}

class _PackageDurationState extends State<PackageDuration> {
  final durations = [
    {"label": "1 Hour", "desc": "Perfect for training", "hours": 1},
    {"label": "2 Hour", "desc": "Perfect for training", "hours": 2},
    {"label": "3 Hour", "desc": "Perfect for training", "hours": 3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Package Duration", style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black
        )),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: durations.map((duration) {
            final totalPrice = widget.price * (duration["hours"] as int);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderSummary(
                      courtName: widget.courtName,
                      duration: duration["hours"] as int,
                      totalPrice: totalPrice,
                      pricePerHour: widget.price,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 86,
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(duration["label"] as String,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            )),
                        const Spacer(),
                        Text(
                          formatter.format(totalPrice),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 0),
                    Row(
                      children: [
                        Text(duration["desc"] as String,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey,
                            )),
                        const Spacer(),
                        
                        Text("per session", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey,
                        ))
                      ],
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
