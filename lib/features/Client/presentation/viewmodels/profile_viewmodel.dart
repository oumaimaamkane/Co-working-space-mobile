import 'package:coworking_space_mobile/config/services/sync_auth.dart';
import 'package:flutter/material.dart';


class ProfileViewModel {
  Future<void> logout(BuildContext context) async {
    // Navigator.pop(context); // Close the drawer
    await SyncAuth.logout(context);
  }
}
