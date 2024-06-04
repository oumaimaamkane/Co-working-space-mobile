import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;
  final bool endIcon;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
    this.endIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: textColor ?? Colors.black),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: endIcon ? const Icon(Icons.chevron_right, color: Colors.black) : null,
    );
  }
}
