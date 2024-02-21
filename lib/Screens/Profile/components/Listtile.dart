import 'package:flutter/material.dart';
import 'package:task_app/Data/AppColors.dart';
import 'package:task_app/Data/AppTypography.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.kthemedark,
      ),
      title: Text(
        text,
        style: AppTypography.kSemiBold16,
      ),
    );
  }
}
