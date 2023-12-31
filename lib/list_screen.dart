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
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 1),
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
                          textStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        service.price,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    service.description,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      _toggleService(service);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedServices.contains(service)
                          ? Colors.brown[100]
                          : Colors.brown,
                    ),
                    child: Text(
                      selectedServices.contains(service) ? 'Remove' : 'Add',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.white,
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
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown.withOpacity(0.5),
                        Colors.brown.withOpacity(0.7),
                        Colors.brown.withOpacity(0.9),
                        Colors.brown.withOpacity(0.7),
                        Colors.brown.withOpacity(0.5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Selected Services',
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
                        color: Colors.white,
                      ),
                      for (Services service in selectedServices) ...[
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                service.name,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: .5,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 1),
                            Text(
                              service.price,
                              style: GoogleFonts.openSans(
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
                      SizedBox(height: 16),
                      Text(
                        'Total Amount : Rs. $totalAmount/-',
                        style: GoogleFonts.poppins(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => ConfirmationScreen()));
                          },
                          fillColor: Colors.black,
                          constraints: BoxConstraints(maxHeight: 100),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Book',
                            style: GoogleFonts.poppins(
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
                ),
              ),
            );
          },
        );
      },
    );
  }
}
