import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                title: 'Contacto y visitas',
                subtitle: 'Estamos listos para atender tus consultas y visitas guiadas.',
              ),
              const SizedBox(height: 24),
              isNarrow
                  ? Column(
                      children: [
                        _ContactForm(),
                        const SizedBox(height: 20),
                        _ContactInfo(items: AppData.contactItems),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(child: _ContactForm()),
                        const SizedBox(width: 24),
                        Expanded(child: _ContactInfo(items: AppData.contactItems)),
                      ],
                    ),
            ],
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _VisitSchedule(items: AppData.visitSlots),
        ),
        SectionContainer(
          child: _MapSection(),
        ),
      ],
    );
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Nombre completo'),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(labelText: 'Correo institucional'),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(labelText: 'Programa de interes'),
          ),
          const SizedBox(height: 12),
          TextField(
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Mensaje',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Enviando solicitud...')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navy,
                foregroundColor: Colors.white,
              ),
              child: const Text('Enviar solicitud'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final List<ContactItem> items;

  const _ContactInfo({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Informacion general', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
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
          ),
        ],
      ),
    );
  }
}

class _VisitSchedule extends StatelessWidget {
  final List<EventItem> items;

  const _VisitSchedule({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Horarios de visita',
          subtitle: 'Coordina recorridos presenciales o sesiones virtuales.',
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items
              .map(
                (slot) => Container(
                  width: 260,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(slot.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      Text('${slot.date} · ${slot.category}',
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(height: 6),
                      Text(slot.location, style: Theme.of(context).textTheme.bodySmall),
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

class _MapSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Sedes y ubicacion',
          subtitle: 'Encuentra el campus mas cercano y conoce nuestras sedes.',
        ),
        const SizedBox(height: 20),
        isNarrow
            ? Column(
                children: [
                  _MapImage(),
                  const SizedBox(height: 20),
                  _CampusList(),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _MapImage()),
                  const SizedBox(width: 20),
                  const Expanded(child: _CampusList()),
                ],
              ),
      ],
    );
  }
}

class _MapImage extends StatelessWidget {
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

class _CampusList extends StatelessWidget {
  const _CampusList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Campus Norte', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 6),
          Text('Calle Principal #100 · Quito', style: TextStyle(color: AppColors.mutedText)),
          SizedBox(height: 12),
          Text('Campus Centro', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 6),
          Text('Av. Central 324 · Quito', style: TextStyle(color: AppColors.mutedText)),
          SizedBox(height: 12),
          Text('Campus Sur', style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 6),
          Text('Via Industrial Km 5 · Quito', style: TextStyle(color: AppColors.mutedText)),
        ],
      ),
    );
  }
}
