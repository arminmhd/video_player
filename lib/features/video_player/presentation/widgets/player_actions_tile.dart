import 'package:flutter/material.dart';

class PlayerActionsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final VoidCallback onTap;

  const PlayerActionsTile({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
      trailing: value != null ? Text(value!) : const Icon(Icons.chevron_right),
    );
  }
}
