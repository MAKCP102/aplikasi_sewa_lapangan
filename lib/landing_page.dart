import 'package:aplikasi_sewa_lapangan/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 320,
                width: 320,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/bg.png")),
                ),
              ),
              SizedBox(height: 50),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Court Booking", style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 30
                  )),
                  SizedBox(height: 15),

                  Text("Easily and quickly book sports courts at your convenience. Choose from a variety of courts, select your preferred duration, and confirm your booking seamlessly",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey[600]
                  )),
                  SizedBox(height: 30),

                  ElevatedButton(style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text("Get Started", style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ))
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
