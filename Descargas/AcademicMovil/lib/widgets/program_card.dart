import 'package:flutter/material.dart';

import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import 'tag_chip.dart';

class ProgramCard extends StatelessWidget {
  final ProgramItem program;
  final VoidCallback? onPlan;

  const ProgramCard({super.key, required this.program, this.onPlan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(program.name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(program.faculty, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 12),
          Row(
            children: [
              _MetaChip(label: program.level),
              const SizedBox(width: 8),
              _MetaChip(label: program.mode),
            ],
          ),
          const SizedBox(height: 12),
          Text('Duracion: ${program.duration}', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Text(program.accreditation, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: program.tags.map((tag) => TagChip(label: tag)).toList(),
          ),
          const Spacer(),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: onPlan,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.navy,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 44),
            ),
            child: const Text('Ver plan de estudios'),
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final String label;

  const _MetaChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
