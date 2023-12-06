import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_page/screens/confirmation_screen.dart';
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
              itemCount: ServicesList.length,
              itemBuilder: (context, index) {
                Services service = ServicesList[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      service.images,
                      width: 60,
                      height: 40,
                      fit: BoxFit.fitWidth,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.name,
                          style: GoogleFonts.openSans(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          service.price,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(service.description,style: GoogleFonts.poppins()),

                    trailing: OutlinedButton(
                      onPressed: () {
                        _toggleService(service);
                      },
                      style: OutlinedButton.styleFrom(
                      ),
                      child: Text(
                        selectedServices.contains(service) ? 'Remove' : 'Add',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.brown,
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
                  Colors.grey.withOpacity(0.4),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Services',
                    style: GoogleFonts.openSans(
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
                          style: GoogleFonts.openSans(
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
                          style: GoogleFonts.poppins(
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
                          style: GoogleFonts.poppins(
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
                  if (totalAmount > 0)
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConfirmationScreen()));

                         },
                      fillColor: Colors.black,
                      constraints: BoxConstraints(maxHeight: 100),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Book',
                        style: GoogleFonts.openSans(
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