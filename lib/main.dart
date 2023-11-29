import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 100, 0)),
            Image.asset(
              'image/scissors.jpeg',
              width: 80,
              height: 60.0,
              fit: BoxFit.cover,
            ),
            Text("Scissors",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Services",style: TextStyle(fontWeight: FontWeight.bold),),
            Column(
              children: [Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard('Mens Haircut', '(professional haircut that suits your face shape and specially trained stylist for Men)', 'image/haircut.jpeg', 200),
                  buildCard('Mens shaving', '(professional beard grooming that suits your face shape & Smooth and Straight for a fresh look.)', 'image/shaving.jpeg', 200),
                  buildCard('Hair colour', '(Even and mess-free color application.)', 'image/haircolor.jpeg', 300),
                  buildCard('Face care', '(Cleansing of neck, face along with scrubbing and deep cleaning of face to remove dead skin)', 'image/facecare.jpeg', 500),
                  buildCard('Massage', '(Relaxing Oil massage to treat stiff / tense muscle & relieve stress.)', 'image/massage.jpeg', 400),
                ],
              ),
        ]
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String productName, String description, String imagePath, double price) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 20.0,
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 60.0,
              height: 50.0,
              fit: BoxFit.cover,

            ),
            SizedBox(width: 20.0,height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('\Rs.$price/-'),
                Text(
                  description,
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            Spacer(), // Add this to push the button to the right
            ElevatedButton(
              onPressed: () {
                // Add to Cart logic
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
