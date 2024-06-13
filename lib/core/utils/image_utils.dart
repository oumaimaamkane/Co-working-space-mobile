import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ImageUtils {
  static Future<String?> uploadImage(File imageFile, String folderName) async {
    try {
      // Generate a unique image name
      String imageName = '${folderName}_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Upload the image to Firebase Storage
      Reference ref = FirebaseStorage.instance.ref().child('$folderName/$imageName');
      await ref.putFile(imageFile);

      // Get the download URL for the image
      String imageUrl = await ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      // Handle the error appropriately
      print('Failed to upload image: $e');
      return null;
    }
  }
}
