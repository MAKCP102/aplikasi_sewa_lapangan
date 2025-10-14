import 'package:aplikasi_sewa_lapangan/package_duration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0
);

class Court {
  final String name;
  final String type;
  final String floor;
  final double rating;
  final int price;

  Court({
    required this.name,
    required this.type,
    required this.floor,
    required this.rating,
    required this.price,
});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> courts = [
    {
      "name": "Futsal Court A",
      "type": "Indoor",
      "floor": "Air Conditioned",
      "rating": 4.8,
      "price": 50000,
      "image": "assets/images/court1.png"
    },
    {
      "name": "Basketball Court B",
      "type": "Outdoor",
      "floor": "Premium Floor",
      "rating": 4.7,
      "price": 75000,
      "image": "assets/images/court2.png"
    },
    {
      "name": "Badminton Court C",
      "type": "Indoor",
      "floor": "Wooden Floor",
      "rating": 4.9,
      "price": 45000,
      "image": "assets/images/court3.png"
    },
    {
      "name": "Tennis Court D",
      "type": "Outdoor",
      "floor": "Hard Surface",
      "rating": 4.6,
      "price": 80000,
      "image": "assets/images/court4.png"
    },
    {
      "name": "Volleyball Court E",
      "type": "Indoor",
      "floor": "Synthetic Floor",
      "rating": 4.5,
      "price": 60000,
      "image": "assets/images/court5.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Sports Courts", style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black
        )),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: courts.length,
        itemBuilder: (context, index) {
          final court = courts[index];
          return Card(
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    court["image"],
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(court["name"], style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black
                          )),
                          const Spacer(),

                          const Icon(Icons.star, color: Colors.orange, size: 18,),
                          const SizedBox(height: 4),
                          Text(court["rating"].toString(), style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          )),
                        ],
                      ),

                      Text("${court["type"]} - ${court["floor"]}", style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey
                      )),
                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Text(formatter.format(court["price"]), style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black
                          )),
                          const Spacer(),

                          ElevatedButton(style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.black87,
                          ),
                              onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PackageDuration(
                              courtName: court["name"],
                              price: court["price"] as int,
                            )));
                              },
                              child: Text("Select", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white
                              ))
                          )
                        ],
                      )
                    ]
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
