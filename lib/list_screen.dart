import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_page/screens/service_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Services> selectedServices = [];
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              itemCount: ServicesList.length,
              itemBuilder: (context, index) {
                Services service = ServicesList[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      service.images,
                      width: 80,
                      height: 60,
                      fit: BoxFit.fitWidth,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.name,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 2,
                          ),
                        ),
                        Text(
                          service.price,
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(service.description),
                    trailing: OutlinedButton(
                      onPressed: () {
                        _toggleService(service);
                      },
                      style: OutlinedButton.styleFrom(
                        primary: Colors.blue, // Button background color
                      ),
                      child: Text(
                        selectedServices.contains(service) ? 'Remove' : 'Add',
                        style: GoogleFonts.b612(
                          textStyle: TextStyle(
                            color: Colors.deepPurple,
                            letterSpacing: .5,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _toggleService(Services service) {
    setState(() {
      if (selectedServices.contains(service)) {
        selectedServices.remove(service);
        totalAmount -=
            double.tryParse(service.price.replaceAll(RegExp(r'[^\d.]'), '')) ??
                0.0;
      } else {
        selectedServices.add(service);
        totalAmount +=
            double.tryParse(service.price.replaceAll(RegExp(r'[^\d.]'), '')) ??
                0.0;
      }
    });

    _showSelectedServices(context);
  }

  void _showSelectedServices(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.grey.withOpacity(0.4),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.7),
                  Colors.grey.withOpacity(0.4)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Selected Services',
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    endIndent: 15,
                    indent: 15,
                  ),
                  for (Services service in selectedServices) ...[
                    SizedBox(height: 8, width: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          service.name,
                          style: GoogleFonts.b612(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '-',
                          style: GoogleFonts.b612(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          service.price,
                          style: GoogleFonts.b612(
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: 16, width: 40),
                  Text(
                    'Total Amount : Rs. $totalAmount/-',
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Conditionally render RawMaterialButton
                  if (totalAmount > 0)
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      fillColor: Colors.black,
                      constraints: BoxConstraints(maxHeight: 100),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Book',
                        style: GoogleFonts.fahkwang(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .6,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}