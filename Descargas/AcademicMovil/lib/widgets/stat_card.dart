import 'package:flutter/material.dart';

import '../models/portal_models.dart';
import '../theme/app_theme.dart';

class StatCard extends StatelessWidget {
  final StatItem item;

  const StatCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: AppTheme.softShadow,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: item.color.withOpacity(0.15),
            child: Icon(item.icon, color: item.color),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.navy)),
              const SizedBox(height: 4),
              Text(item.label, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
