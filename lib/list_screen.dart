import 'package:flutter/material.dart';
import 'package:salon_page/screens/popup.dart';
import 'package:salon_page/screens/service_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Services> selectedServices = [];

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
                      child: Text(selectedServices.contains(service) ? 'Remove' : 'Add'),
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
      } else {
        selectedServices.add(service);
      }
    });
  }

  void _showSelectedServices(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Services'),
              for (Services service in selectedServices) ...[
                SizedBox(height: 8, width: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      service.price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
              SizedBox(height: 16, width: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Book Appointment'),
              ),
            ],
          ),
        );
      },
    );
  }
}
