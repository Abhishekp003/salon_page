import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/background.jpeg",),
              fit: BoxFit.cover,),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "image/scissors.jpeg",
                  width: 120,
                  height: 120,
                ),
              ),
              Text(
                "Scissor's",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
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
                        SizedBox(width: 0), // Add space between the image and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Booking is Confirmed for",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),

                            Text(
                              "Name:",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Ph No.:",
                              style: TextStyle(
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
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Scissor's",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Icon(
                            Icons.calendar_month_sharp,
                            size: 30,
                            color: Colors.blueGrey,
                          ),
                          SizedBox(height: 5,),
                          Text(("Wednesday"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                          SizedBox(height: 2,),
                          Text(("29-11-2023"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                          SizedBox(height: 2,),
                          Text(("11am - 12pm"),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
