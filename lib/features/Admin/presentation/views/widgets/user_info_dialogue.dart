import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';

class UserInfoDialog extends StatelessWidget {
  final UserModel user;

  const UserInfoDialog({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('User Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Name'),
            subtitle: Text(user.name),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(user.email),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Phone'),
            subtitle: Text(user.phone ?? 'N/A'),
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Role'),
            subtitle: Text(user.role),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
