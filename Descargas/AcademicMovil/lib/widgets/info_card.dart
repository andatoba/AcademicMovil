import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final String? actionLabel;
  final VoidCallback? onAction;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
          if (actionLabel != null) ...[
            const SizedBox(height: 16),
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(foregroundColor: color),
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
