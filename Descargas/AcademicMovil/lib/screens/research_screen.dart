import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import '../widgets/info_card.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../widgets/stat_card.dart';

class ResearchScreen extends StatelessWidget {
  const ResearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      children: [
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Investigacion aplicada',
                subtitle: 'Laboratorios, proyectos y publicaciones con impacto real.',
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: AppData.researchStats
                    .map((item) => SizedBox(width: 260, child: StatCard(item: item)))
                    .toList(),
              ),
            ],
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _LabsSection(items: AppData.labs),
        ),
        SectionContainer(
          child: _ProjectsSection(),
        ),
        SectionContainer(
          background: Colors.white,
          child: _PublicationsSection(items: AppData.publications),
        ),
      ],
    );
  }
}

class _LabsSection extends StatelessWidget {
  final List<ResearchLabItem> items;

  const _LabsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Centros y laboratorios',
          subtitle: 'Equipos multidisciplinarios en constante investigacion.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items
              .map(
                (lab) => Container(
                  width: 300,
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
                      Text(lab.name, style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text(lab.focus, style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(height: 12),
                      Text('Lider: ${lab.lead}', style: Theme.of(context).textTheme.bodySmall),
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

class _ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Proyectos estrategicos',
          subtitle: 'Iniciativas vigentes con participacion docente y estudiantil.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: AppData.researchProjects
              .map(
                (item) => SizedBox(
                  width: 300,
                  child: InfoCard(
                    icon: item.icon,
                    title: item.title,
                    description: item.description,
                    color: item.color,
                    actionLabel: item.action,
                    onAction: () {},
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _PublicationsSection extends StatelessWidget {
  final List<NewsItem> items;

  const _PublicationsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Publicaciones recientes',
          subtitle: 'Contenido academico y reportes institucionales.',
        ),
        const SizedBox(height: 20),
        ...items.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(item.tag, style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(item.summary, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                Text(item.date, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
