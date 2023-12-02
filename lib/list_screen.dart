import 'package:flutter/material.dart';
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
                    trailing: ElevatedButton(
                      onPressed: () {
                        _toggleService(service);
                        _showSelectedServices(context);
                      },
                      child: Text(selectedServices.contains(service)
                          ? 'Remove'
                          : 'Add',style: TextStyle(color: Colors.black),),
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
  }

  void _showSelectedServices(BuildContext context) {
    double totalAmount = 0.0;

    showModalBottomSheet(backgroundColor:Colors.grey,
      context: context,
      builder: (BuildContext context) {
        for (Services service in selectedServices) {
          String priceString = service.price.replaceAll(RegExp(r'[^\d.]'), '');
          double price = double.tryParse(priceString) ?? 0.0;
          totalAmount += price;
        }

        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Services'),
              for (Services service in selectedServices) ...[
                SizedBox(height: 8, width: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      service.price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

              ],
              SizedBox(height: 16, width: 40),
              Text(
                'Total Amount: Rs. $totalAmount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:Column(children: [
        Text('Book Appointment'),
        ]
                )
              ),
            ],
          ),
        );
      },
    );
  }
}
