import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import '../widgets/info_card.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import 'admissions_login_screen.dart';

class AdmissionsScreen extends StatelessWidget {
  const AdmissionsScreen({super.key});

  void _openLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AdmissionsLoginScreen()),
    );
  }

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
                title: 'Admisiones abiertas',
                subtitle: 'Te acompanamos paso a paso en tu proceso de ingreso.',
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: isNarrow
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Convocatoria 2025 - Ciclo 1',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Postulaciones abiertas hasta el 30 de mayo. Cupos limitados.',
                            style: TextStyle(color: AppColors.mutedText),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => _openLogin(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.navy,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Iniciar postulacion'),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Convocatoria 2025 - Ciclo 1',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Postulaciones abiertas hasta el 30 de mayo. Cupos limitados.',
                                  style: TextStyle(color: AppColors.mutedText),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _openLogin(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.navy,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Iniciar postulacion'),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _StepsSection(items: AppData.admissionSteps),
        ),
        SectionContainer(
          child: _RequirementsSection(),
        ),
        SectionContainer(
          background: Colors.white,
          child: _ScholarshipsSection(),
        ),
        SectionContainer(
          child: _FaqSection(items: AppData.faqs),
        ),
        SectionContainer(
          background: Colors.white,
          child: _VisitSection(),
        ),
      ],
    );
  }
}

class _StepsSection extends StatelessWidget {
  final List<AdmissionStepItem> items;

  const _StepsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Proceso de admision',
          subtitle: 'Un recorrido claro para asegurar tu ingreso.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items
              .map(
                (item) => Container(
                  width: 260,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.timeline,
                          style: const TextStyle(
                            color: AppColors.gold,
                            fontWeight: FontWeight.w700,
                          )),
                      const SizedBox(height: 8),
                      Text(item.title, style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 6),
                      Text(item.description, style: Theme.of(context).textTheme.bodySmall),
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

class _RequirementsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Requisitos basicos',
          subtitle: 'Documentos necesarios para validar tu postulacion.',
        ),
        const SizedBox(height: 20),
        isNarrow
            ? Column(
                children: [
                  _RequirementsList(),
                  const SizedBox(height: 20),
                  _RequirementsPanel(),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _RequirementsList()),
                  const SizedBox(width: 20),
                  const Expanded(child: _RequirementsPanel()),
                ],
              ),
      ],
    );
  }
}

class _RequirementsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppData.admissionRequirements
          .map(
            (requirement) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline, color: AppColors.teal),
                  const SizedBox(width: 12),
                  Expanded(child: Text(requirement)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _RequirementsPanel extends StatelessWidget {
  const _RequirementsPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Asesoria personalizada',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nuestro equipo revisa tu perfil y te recomienda la mejor ruta.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.navyDark,
            ),
            child: const Text('Solicitar orientacion'),
          ),
        ],
      ),
    );
  }
}

class _ScholarshipsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Becas y beneficios',
          subtitle: 'Opciones de financiamiento para acelerar tu ingreso.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: AppData.scholarships
              .map(
                (item) => SizedBox(
                  width: 280,
                  child: InfoCard(
                    icon: item.icon,
                    title: item.title,
                    description: item.description,
                    color: item.color,
                    actionLabel: 'Ver requisitos',
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

class _FaqSection extends StatelessWidget {
  final List<FaqItem> items;

  const _FaqSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Preguntas frecuentes',
          subtitle: 'Resuelve dudas comunes sobre tu proceso de ingreso.',
        ),
        const SizedBox(height: 20),
        ...items.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: ExpansionTile(
              title: Text(item.question),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              children: [
                Text(item.answer, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _VisitSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Agenda tu visita',
          subtitle: 'Conoce el campus, laboratorios y experiencia estudiantil.',
        ),
        const SizedBox(height: 20),
        isNarrow
            ? Column(
                children: [
                  _VisitSlots(),
                  const SizedBox(height: 20),
                  _VisitImage(),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _VisitSlots()),
                  const SizedBox(width: 20),
                  Expanded(child: _VisitImage()),
                ],
              ),
      ],
    );
  }
}

class _VisitSlots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppData.visitSlots
          .map(
            (slot) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.surface,
                    child: const Icon(Icons.event_available_outlined, color: AppColors.navy),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(slot.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text('${slot.date} - ${slot.category}',
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(slot.location, style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _VisitImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        AppData.visitImage,
        height: 260,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
