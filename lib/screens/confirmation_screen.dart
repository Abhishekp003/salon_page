import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/background2.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.8)),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 35)),
              Center(
                child: Image.asset(
                  "image/scissors2.png",
                  width: 120,
                  height: 120,
                ),
              ),
              Text(
                "Scissor's",
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),

              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                    bottom: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 2)),
                        Image.asset(
                          "image/tick.jpeg",
                          width: 85,
                          height: 70,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Booking is Confirmed for",
                                style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            SizedBox(height: 5),

                            Text(
                              "Name:",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Ph No.:",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black54,
                      thickness: 2,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Scissor's",
                            style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
                          ),
                          Icon(
                            Icons.calendar_month_sharp,
                            size: 30,
                            color: Colors.blueGrey,
                          ),
                          SizedBox(height: 5,),
                          Text(("Wednesday"),style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                          SizedBox(height: 2,),
                          Text(("29-11-2023"),style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                          SizedBox(height: 2,),
                          Text(("11am - 12pm"),style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
