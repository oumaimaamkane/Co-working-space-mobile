import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/config/services/sync_auth.dart';

class AdminProfileViewModel {
  Future<void> logout(BuildContext context) async {
    await SyncAuth.logout(context); // Replace with your logout logic for admin
  }
}
