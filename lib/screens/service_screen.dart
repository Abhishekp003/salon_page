import 'dart:developer';

import 'package:flutter/material.dart';

class Services {
  late String name;
  late String price;
  late String description;
  late String images;


  Services({required this.name,
    required this.price,
    required this.description,
    required this.images,});
}

  List<Services>ServicesList=[
    Services(name: 'Mens Haircut', price: 'Rs 200/-', description: '(professional haircut that suits your face shape and specially trained stylist for Men.)', images:  'image/haircut.jpeg',),
Services(name:'Mens shaving', price: 'Rs 200/-', description: '(professional beard grooming that suits your face shape & Smooth and Straight for a fresh look.)', images:  'image/shaving.jpeg',),
Services(name: 'Hair colour',price: 'Rs 300/-', description: '(Even and mess-free color application.)', images: 'image/haircolor.jpeg',),
Services(name: 'Face care', price: 'Rs 500/-', description: '(Cleansing of neck, face along with scrubbing and deep cleaning of face to remove dead skin.)', images:  'image/facecare.jpeg',),
Services(name:'Massage', price: 'Rs 400/-', description: '(Relaxing Oil massage to treat stiff / tense muscle & relieve stress.)', images:  'image/massage.jpeg',),



];