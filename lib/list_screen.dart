import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_page/screens/service_screen.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: ServicesList.length,
            itemBuilder: (context, index) {
              Services service = ServicesList[index];
              return Card(
                  child: ListTile(
                    leading: Image.asset(service.images,width:80,height:60,fit: BoxFit.fitWidth,),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.name,
                          style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold,
                              height: 2),
                        ),
                        Text(service.price, style: TextStyle(
                          fontWeight: FontWeight.w200,),),
                      ],
                    ),
                    subtitle: Text(service.description,),
                    trailing: ElevatedButton(
                      onPressed: () {}, child: Text('Add'),
                    ),
                  )
              );
            }));
  }}