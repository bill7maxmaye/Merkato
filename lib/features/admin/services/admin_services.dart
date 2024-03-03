import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:merkato/constants/utils.dart';

class AdminServices{

  void sellProducts({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images, 

  }) async {
    try{
      final cloudinary = CloudinaryPublic('dvjj6d6pg', 'cr7hjpdi');
      List<String> imageUrls = [];

      for (int i=0; i<images.length; i++){
          CloudinaryResponse res = await cloudinary.uploadFile(
              CloudinaryFile.fromFile(images[i].path, folder: name),
          );

          imageUrls.add(res.secureUrl);
      } 
    }
    catch(e){
      showSnackBar(context, e.toString())
    }
  }
}