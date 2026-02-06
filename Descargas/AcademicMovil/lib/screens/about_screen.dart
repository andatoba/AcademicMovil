import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import '../widgets/info_card.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      children: [
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Nuestra historia',
                subtitle: 'Una institucion con vision global y compromiso local.',
              ),
              const SizedBox(height: 24),
              _MissionVision(),
            ],
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _TimelineSection(items: AppData.timeline),
        ),
        SectionContainer(
          child: _LeadershipSection(items: AppData.leaders),
        ),
        SectionContainer(
          background: Colors.white,
          child: _ValuesSection(),
        ),
        SectionContainer(
          child: _AccreditationsSection(),
        ),
      ],
    );
  }
}

class _MissionVision extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        _MissionCard(
          title: 'Mision',
          description:
              'Formar profesionales con pensamiento critico, liderazgo etico y capacidad de innovar.',
          icon: Icons.track_changes_outlined,
        ),
        _MissionCard(
          title: 'Vision',
          description:
              'Ser un referente regional en educacion aplicada, tecnologia y emprendimiento.',
          icon: Icons.visibility_outlined,
        ),
        _MissionCard(
          title: 'Proposito',
          description:
              'Impulsar oportunidades a traves del conocimiento y la colaboracion.',
          icon: Icons.handshake_outlined,
        ),
      ],
    );
  }
}

class _MissionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _MissionCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.navy,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _TimelineSection extends StatelessWidget {
  final List<TimelineItem> items;

  const _TimelineSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Linea de tiempo',
          subtitle: 'Hitos que marcan nuestra evolucion.',
        ),
        const SizedBox(height: 24),
        ...items.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.navy,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    item.year,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Text(item.description, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LeadershipSection extends StatelessWidget {
  final List<LeaderItem> items;

  const _LeadershipSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Equipo directivo',
          subtitle: 'Lideres que impulsan nuestra vision institucional.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items
              .map(
                (leader) => Container(
                  width: 280,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.border),
                    boxShadow: AppTheme.softShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(radius: 30, backgroundImage: NetworkImage(leader.imageUrl)),
                      const SizedBox(height: 12),
                      Text(leader.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(leader.role, style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(height: 10),
                      Text(leader.focus, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ValuesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Nuestros valores',
          subtitle: 'Principios que guian cada decision academica.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: AppData.values
              .map(
                (item) => SizedBox(
                  width: 300,
                  child: InfoCard(
                    icon: item.icon,
                    title: item.title,
                    description: item.description,
                    color: item.color,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _AccreditationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Acreditaciones y alianzas',
          subtitle: 'Redes que respaldan la calidad de nuestros programas.',
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AppData.accreditations
              .map(
                (item) => Chip(
                  label: Text(item),
                  backgroundColor: AppColors.surface,
                  side: const BorderSide(color: AppColors.border),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
