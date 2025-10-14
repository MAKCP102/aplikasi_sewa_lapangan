import 'package:aplikasi_sewa_lapangan/qris_payment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethod extends StatelessWidget {
  final String courtName;
  final int duration;
  final int totalPrice;
  final int pricePerHour;

  const PaymentMethod({
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

      body: Padding(padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Text("Choose Payment", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black
                ))
              ],
            ), SizedBox(height: 15),

            Row(
              children: [
                Text("Select your preferred payment method", style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey[800]
                ))
              ],
            ), SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
                child: Container(
                  // height: 86,
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        radius: 22,
                        child: const Icon(FontAwesomeIcons.wallet, color: Colors.black, size: 22
                        ),
                      ), const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pay on Location",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          Text("Cash payment",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                              )),
                          SizedBox(height: 20),
                          Text("Pay with cash when you arrive at the location", style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700]
                          ))
                        ],
                      ),
                    ],
                  ),
                )
            ), SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QrisPayment(
                      courtName: courtName,
                      duration: duration,
                      totalPrice: totalPrice,
                      pricePerHour: pricePerHour
                    )
                    ));
              },
              child: Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      radius: 22,
                      child: const Icon(FontAwesomeIcons.qrcode, color: Colors.black, size: 22
                      ),
                    ), SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pay via QRIS", style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                        Text("Digital payment", style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400
                        )), SizedBox(height: 20),
                        Text("Scan QR code to pay instantly with your e- wallet",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700]
                          ),
                        )
                      ]
                    )
                  ],
                ),
              ),
            ), SizedBox(height: 50),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.exclamationCircle),
                      SizedBox(width: 10),
                      Text("Booking Policy", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      )),
                    ],
                  ), SizedBox(height: 5),

                  Column(
                    children: [
                      Text("Free cancellation up to 5 hours before your booking time. Equipment rental available on- site.",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
