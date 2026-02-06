import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import '../widgets/info_card.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';

class ServicesScreen extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const ServicesScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      children: [
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Servicios integrales',
                subtitle: 'Todo lo que necesitas para tu vida academica en un solo lugar.',
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: AppData.digitalServices
                    .map(
                      (service) => SizedBox(
                        width: 280,
                        child: InfoCard(
                          icon: service.icon,
                          title: service.title,
                          description: service.description,
                          color: service.color,
                          actionLabel: service.action,
                          onAction: () {},
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _CampusServicesSection(items: AppData.campusServices),
        ),
        SectionContainer(
          child: _ProceduresSection(),
        ),
        SectionContainer(
          background: Colors.white,
          child: _SupportSection(onNavigate: onNavigate),
        ),
      ],
    );
  }
}

class _CampusServicesSection extends StatelessWidget {
  final List<ServiceItem> items;

  const _CampusServicesSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Servicios presenciales',
          subtitle: 'Atencion directa para gestiones clave dentro del campus.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items
              .map(
                (service) => SizedBox(
                  width: 280,
                  child: InfoCard(
                    icon: service.icon,
                    title: service.title,
                    description: service.description,
                    color: service.color,
                    actionLabel: service.action,
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

class _ProceduresSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Tramites frecuentes',
          subtitle: 'Solicitudes digitales para ahorrar tiempo.',
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AppData.procedures
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

class _SupportSection extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const _SupportSection({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Canales de soporte',
          subtitle: 'Nuestro equipo esta listo para ayudarte.',
        ),
        const SizedBox(height: 20),
        isNarrow
            ? Column(
                children: [
                  _SupportList(),
                  const SizedBox(height: 16),
                  _SupportCta(onNavigate: onNavigate),
                ],
              )
            : Row(
                children: [
                  const Expanded(child: _SupportList()),
                  const SizedBox(width: 20),
                  Expanded(child: _SupportCta(onNavigate: onNavigate)),
                ],
              ),
      ],
    );
  }
}

class _SupportList extends StatelessWidget {
  const _SupportList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppData.contactItems
          .map(
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
                  Icon(item.icon, color: AppColors.navy),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.label, style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(item.value, style: Theme.of(context).textTheme.bodySmall),
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

class _SupportCta extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const _SupportCta({required this.onNavigate});

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
            'Necesitas ayuda inmediata?',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Escribenos y un asesor respondera en menos de 24 horas.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => onNavigate(AppNavIndex.contact),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.navyDark,
            ),
            child: const Text('Ir a contacto'),
          ),
        ],
      ),
    );
  }
}
