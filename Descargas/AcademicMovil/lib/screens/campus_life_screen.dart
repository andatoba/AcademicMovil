import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import '../widgets/info_card.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';

class CampusLifeScreen extends StatelessWidget {
  const CampusLifeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return PageScaffold(
      children: [
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Vida estudiantil',
                subtitle: 'Bienestar, comunidad y experiencias fuera del aula.',
              ),
              const SizedBox(height: 20),
              isNarrow
                  ? Column(
                      children: [
                        _LifeIntroPanel(),
                        const SizedBox(height: 20),
                        _LifeImage(),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: _LifeIntroPanel()),
                        const SizedBox(width: 20),
                        Expanded(child: _LifeImage()),
                      ],
                    ),
            ],
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _ClubSection(items: AppData.clubs),
        ),
        SectionContainer(
          child: _FacilitiesSection(items: AppData.facilities),
        ),
        SectionContainer(
          background: Colors.white,
          child: _CampusEventsSection(items: AppData.events),
        ),
      ],
    );
  }
}

class _LifeIntroPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Comunidad que inspira',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8),
          Text(
            'Programas de liderazgo, deportes, cultura y bienestar para una experiencia integral.',
            style: TextStyle(color: AppColors.mutedText),
          ),
          SizedBox(height: 16),
          _LifeTag(label: 'Mentorias y coaching'),
          SizedBox(height: 8),
          _LifeTag(label: 'Eventos semanales'),
          SizedBox(height: 8),
          _LifeTag(label: 'Red de voluntariado'),
        ],
      ),
    );
  }
}

class _LifeTag extends StatelessWidget {
  final String label;

  const _LifeTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: AppColors.teal, size: 18),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

class _LifeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        AppData.campusMapImage,
        height: 260,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _ClubSection extends StatelessWidget {
  final List<ClubItem> items;

  const _ClubSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Clubes y comunidades',
          subtitle: 'Espacios para crear, competir y colaborar.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items
              .map(
                (club) => InfoCard(
                  icon: club.icon,
                  title: club.name,
                  description: club.description,
                  color: AppColors.navy,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _FacilitiesSection extends StatelessWidget {
  final List<FacilityItem> items;

  const _FacilitiesSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Espacios del campus',
          subtitle: 'Infraestructura pensada para aprender y crear.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items
              .map(
                (facility) => Container(
                  width: 300,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.surface,
                        child: Icon(facility.icon, color: AppColors.navy),
                      ),
                      const SizedBox(height: 12),
                      Text(facility.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Text(facility.detail, style: Theme.of(context).textTheme.bodySmall),
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

class _CampusEventsSection extends StatelessWidget {
  final List<EventItem> items;

  const _CampusEventsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Agenda estudiantil',
          subtitle: 'Actividades culturales, deportivas y academicas.',
        ),
        const SizedBox(height: 20),
        ...items.map(
          (event) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.surface,
                  child: const Icon(Icons.event_outlined, color: AppColors.navy),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(event.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text('${event.date} · ${event.location}',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                Text(event.category, style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
