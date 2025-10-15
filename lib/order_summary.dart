import 'package:aplikasi_sewa_lapangan/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final formatter = NumberFormat.currency(
    locale: 'id_id',
    symbol: 'Rp',
    decimalDigits: 0
);

class OrderSummary extends StatelessWidget {
  final String courtName;
  final int duration;
  final int totalPrice;
  final int pricePerHour;

  const OrderSummary({
    super.key,
    required this.courtName,
    required this.duration,
    required this.totalPrice,
    required this.pricePerHour
  });

  @override
  Widget build(BuildContext context) {
    final int serviceFee = 5000;
    final int grandTotal = totalPrice + serviceFee;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Order Summary", style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black
        )),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
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
                        Text(courtName, style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black
                        )),
                      ],
                    ), SizedBox(height: 5),
        
                    Row(
                      children: [
                        Icon(Icons.location_on,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text("Jalan Cibalok, Blok 31b", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          // color: Colors.grey
                        ))
                      ],
                    ), SizedBox(height: 30),
        
                    Row(
                      children: [
                        Icon(Icons.calendar_month,size: 25,),
                        SizedBox(width: 10),
                        Text("Date", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )), const Spacer(),
                        Text("Today, Dec 15", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )),
                      ],
                    ), SizedBox(height: 5),
                    const Divider(thickness: 1, color: Colors.black,),
                    SizedBox(height: 20),
        
                    Row(
                      children: [
                        Icon(Icons.hourglass_bottom,size: 25,),
                        SizedBox(width: 10),
                        Text("Duration", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )), const Spacer(),
                        Text("$duration hours", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )),
                      ],
                    ), SizedBox(height: 5),
                    const Divider(thickness: 1, color: Colors.black,),
                    SizedBox(height: 20),
        
                    Row(
                      children: [
                        Icon(Icons.monetization_on, size: 25,),
                        SizedBox(width: 10),
                        Text("Price per Hour", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )), const Spacer(),
                        Text(formatter.format(pricePerHour), style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        )),
                      ],
                    ), SizedBox(height: 50),
        
                    Row(
                      children: [
                        Text("Subtotal ($duration hours)", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )), const Spacer(),
                        Text(formatter.format(totalPrice), style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ))
                      ],
                    ), SizedBox(height: 15),
        
                    Row(
                      children: [
                        Text("Service Fee", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        )), const Spacer(),
                        Text(formatter.format(serviceFee), style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ))
                      ],
                    ), SizedBox(height: 20),

                    Row(
                      children: [
                        Text("Total", style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )), const Spacer(),
                        Text(formatter.format(grandTotal), style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        )),
                      ],
                    )
                  ]
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
              ), SizedBox(height: 30),
              
              ElevatedButton(style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentMethod(
                      courtName: courtName,
                      duration: duration,
                      totalPrice: totalPrice,
                      pricePerHour: pricePerHour,
                      grandTotal: grandTotal,
                    )
                    ));
              },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Choose Payment Method", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white
                      )),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.white)
                    ],
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
