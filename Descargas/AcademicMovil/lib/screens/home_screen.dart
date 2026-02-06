import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import '../widgets/info_card.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../widgets/stat_card.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      children: [
        _HeroSection(onNavigate: onNavigate),
        SectionContainer(
          background: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: 'Portal academico 360',
                subtitle: 'Gestiona tu vida universitaria desde un solo panel.',
                trailing: ElevatedButton(
                  onPressed: () => onNavigate(AppNavIndex.portal),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navy,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Abrir portal'),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: AppData.portalActions
                    .take(4)
                    .map(
                      (item) => SizedBox(
                        width: 260,
                        child: InfoCard(
                          icon: item.icon,
                          title: item.title,
                          description: item.description,
                          color: item.color,
                          actionLabel: 'Abrir',
                          onAction: () => onNavigate(AppNavIndex.portal),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        SectionContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Experiencia academica integral',
                subtitle: 'Un ecosistema moderno con servicios y acompanamiento continuo.',
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: AppData.highlights
                    .map(
                      (item) => SizedBox(
                        width: 260,
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
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Indicadores clave',
                subtitle: 'Resultados medibles para potenciar tu futuro profesional.',
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: AppData.stats
                    .map((item) => SizedBox(width: 260, child: StatCard(item: item)))
                    .toList(),
              ),
            ],
          ),
        ),
        SectionContainer(
          child: _NewsEventsSection(),
        ),
        SectionContainer(
          background: Colors.white,
          child: _TestimonialsSection(),
        ),
        SectionContainer(
          child: _CallToAction(onNavigate: onNavigate),
        ),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const _HeroSection({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(AppData.heroImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.navy.withOpacity(0.85),
              AppColors.navyDark.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: isNarrow
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HeroText(onNavigate: onNavigate),
                      const SizedBox(height: 28),
                      const _HeroPanel(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _HeroText(onNavigate: onNavigate)),
                      const SizedBox(width: 32),
                      const SizedBox(width: 320, child: _HeroPanel()),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const _HeroText({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppData.heroTitle,
          style: theme.textTheme.displayLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          AppData.heroSubtitle,
          style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70, height: 1.6),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 10,
          children: AppData.heroHighlights
              .map(
                (item) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle, color: AppColors.gold, size: 18),
                    const SizedBox(width: 6),
                    Text(item, style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () => onNavigate(AppNavIndex.programs),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gold,
                foregroundColor: AppColors.navyDark,
              ),
              child: const Text('Explorar programas'),
            ),
            OutlinedButton(
              onPressed: () => onNavigate(AppNavIndex.admissions),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('Becas y admisiones'),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Agenda inmediata', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          const _HeroPanelItem(
            icon: Icons.event_available_outlined,
            title: 'Asesoria personalizada',
            subtitle: 'Agenda una llamada con un orientador.',
          ),
          const SizedBox(height: 12),
          const _HeroPanelItem(
            icon: Icons.menu_book_outlined,
            title: 'Malla curricular',
            subtitle: 'Descarga planes de estudio actualizados.',
          ),
          const SizedBox(height: 12),
          const _HeroPanelItem(
            icon: Icons.location_city_outlined,
            title: 'Visita guiada',
            subtitle: 'Recorre nuestros espacios innovadores.',
          ),
        ],
      ),
    );
  }
}

class _HeroPanelItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _HeroPanelItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.surface,
          child: Icon(icon, color: AppColors.navy, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}

class _NewsEventsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Actualidad y agenda',
          subtitle: 'Noticias destacadas y eventos para planificar tu semestre.',
        ),
        const SizedBox(height: 24),
        isNarrow
            ? Column(
                children: [
                  _NewsList(items: AppData.news),
                  const SizedBox(height: 24),
                  _EventsList(items: AppData.events),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _NewsList(items: AppData.news)),
                  const SizedBox(width: 24),
                  Expanded(child: _EventsList(items: AppData.events)),
                ],
              ),
      ],
    );
  }
}

class _NewsList extends StatelessWidget {
  final List<NewsItem> items;

  const _NewsList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Noticias', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.tag.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.gold,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    )),
                const SizedBox(height: 6),
                Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(item.summary, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 10),
                Text(item.date, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _EventsList extends StatelessWidget {
  final List<EventItem> items;

  const _EventsList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Eventos', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(item.date.split(' ').first,
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      const SizedBox(height: 2),
                      Text(item.date.split(' ').last,
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(item.location, style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(height: 6),
                      Text(item.category,
                          style: const TextStyle(color: AppColors.navy, fontWeight: FontWeight.w600)),
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

class _TestimonialsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Voces de nuestra comunidad',
          subtitle: 'Estudiantes y egresados comparten su experiencia.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: AppData.testimonials
              .map(
                (item) => SizedBox(
                  width: 320,
                  child: _TestimonialCard(item: item),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final TestimonialItem item;

  const _TestimonialCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('"${item.quote}"', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(item.imageUrl)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(item.program, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CallToAction extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const _CallToAction({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.navy, AppColors.navyDark.withOpacity(0.95)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Agenda una visita y descubre tu proximo programa',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          const Text(
            'Conoce laboratorios, docentes y opciones de becas en una experiencia guiada.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => onNavigate(AppNavIndex.contact),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: AppColors.navyDark,
                ),
                child: const Text('Reservar visita'),
              ),
              OutlinedButton(
                onPressed: () => onNavigate(AppNavIndex.admissions),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Ver admisiones'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
