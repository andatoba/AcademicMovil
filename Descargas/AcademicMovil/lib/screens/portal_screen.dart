import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';
import '../widgets/info_card.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../widgets/stat_card.dart';

class PortalScreen extends StatefulWidget {
  final ValueChanged<int> onNavigate;

  const PortalScreen({super.key, required this.onNavigate});

  @override
  State<PortalScreen> createState() => _PortalScreenState();
}

class _PortalScreenState extends State<PortalScreen> {
  late String _selectedPeriod;
  bool _notifyEmail = true;
  bool _notifyWhatsapp = true;
  bool _notifyApp = true;

  @override
  void initState() {
    super.initState();
    _selectedPeriod = AppData.gradePeriods.first;
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final filteredGrades = AppData.grades
        .where((item) => item.period == _selectedPeriod)
        .toList();

    return PageScaffold(
      children: [
        _PortalHero(
          profile: AppData.studentProfile,
          onNavigate: widget.onNavigate,
        ),
        SectionContainer(
          background: Colors.white,
          child: _PortalStatsSection(items: AppData.portalStats),
        ),
        SectionContainer(
          child: _PortalActionsSection(
            items: AppData.portalActions,
            onAction: (service) => _showSnack('Abriendo ${service.title}...'),
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _ScheduleSection(
            schedule: AppData.weeklySchedule,
            calendar: AppData.academicCalendar,
          ),
        ),
        SectionContainer(
          child: _EnrollmentSection(
            items: AppData.enrollmentOffers,
            onAction: () => _showSnack('Simulador de matricula actualizado'),
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _GradesSection(
            periods: AppData.gradePeriods,
            selectedPeriod: _selectedPeriod,
            onPeriodChanged: (value) {
              if (value == null) return;
              setState(() => _selectedPeriod = value);
            },
            items: filteredGrades,
          ),
        ),
        SectionContainer(
          child: _FinanceSection(
            stats: AppData.financeStats,
            items: AppData.financeItems,
            methods: AppData.paymentMethods,
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _LibrarySection(
            loans: AppData.libraryLoans,
            resources: AppData.digitalResources,
          ),
        ),
        SectionContainer(
          child: _DocumentsSection(
            documents: AppData.documents,
            tickets: AppData.tickets,
            procedures: AppData.procedures,
          ),
        ),
        SectionContainer(
          background: Colors.white,
          child: _NotificationsSection(
            items: AppData.notifications,
            notifyEmail: _notifyEmail,
            notifyWhatsapp: _notifyWhatsapp,
            notifyApp: _notifyApp,
            onEmailChanged: (value) => setState(() => _notifyEmail = value),
            onWhatsappChanged: (value) => setState(() => _notifyWhatsapp = value),
            onAppChanged: (value) => setState(() => _notifyApp = value),
          ),
        ),
      ],
    );
  }
}

class _PortalHero extends StatelessWidget {
  final StudentProfile profile;
  final ValueChanged<int> onNavigate;

  const _PortalHero({required this.profile, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.navy, AppColors.navyDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PortalHeroText(profile: profile, onNavigate: onNavigate),
                    const SizedBox(height: 24),
                    _ProfileCard(profile: profile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _PortalHeroText(profile: profile, onNavigate: onNavigate)),
                    const SizedBox(width: 32),
                    SizedBox(width: 360, child: _ProfileCard(profile: profile)),
                  ],
                ),
        ),
      ),
    );
  }
}

class _PortalHeroText extends StatelessWidget {
  final StudentProfile profile;
  final ValueChanged<int> onNavigate;

  const _PortalHeroText({required this.profile, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sistema Academico 360',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 12),
        Text(
          'Administra matricula, calificaciones, finanzas y recursos desde un solo panel.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () => onNavigate(AppNavIndex.services),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gold,
                foregroundColor: AppColors.navyDark,
              ),
              child: const Text('Abrir servicios'),
            ),
            OutlinedButton(
              onPressed: () => onNavigate(AppNavIndex.contact),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('Hablar con asesor'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _StatusPill(label: 'Periodo ${profile.period}', color: AppColors.gold),
            _StatusPill(label: profile.modality, color: AppColors.teal),
            _StatusPill(label: 'Estado ${profile.status}', color: AppColors.sky),
          ],
        ),
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final StudentProfile profile;

  const _ProfileCard({required this.profile});

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
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.surface,
                child: Icon(Icons.person_outline, color: AppColors.navy),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text('ID ${profile.id}', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              _StatusPill(label: profile.status, color: AppColors.teal),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          _InfoRow(label: 'Programa', value: profile.program),
          _InfoRow(label: 'Nivel', value: profile.level),
          _InfoRow(label: 'Campus', value: profile.campus),
          _InfoRow(label: 'Tutor', value: profile.advisor),
          _InfoRow(label: 'Correo', value: profile.email),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Abriendo expediente academico...')),
              );
            },
            icon: const Icon(Icons.assignment_ind_outlined),
            label: const Text('Ver expediente'),
            style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 44)),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _PortalStatsSection extends StatelessWidget {
  final List<StatItem> items;

  const _PortalStatsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Resumen academico',
          subtitle: 'Indicadores clave para monitorear tu avance en tiempo real.',
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: items
              .map((item) => SizedBox(width: 260, child: StatCard(item: item)))
              .toList(),
        ),
      ],
    );
  }
}

class _PortalActionsSection extends StatelessWidget {
  final List<ServiceItem> items;
  final ValueChanged<ServiceItem> onAction;

  const _PortalActionsSection({required this.items, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Accesos rapidos',
          subtitle: 'Gestiona tus procesos academicos en minutos.',
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
                    onAction: () => onAction(service),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ScheduleSection extends StatelessWidget {
  final List<ScheduleItem> schedule;
  final List<CalendarItem> calendar;

  const _ScheduleSection({required this.schedule, required this.calendar});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Horario y calendario',
          subtitle: 'Clases, evaluaciones y fechas clave del semestre.',
        ),
        const SizedBox(height: 24),
        isNarrow
            ? Column(
                children: [
                  _ScheduleCard(items: schedule),
                  const SizedBox(height: 20),
                  _CalendarCard(items: calendar),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _ScheduleCard(items: schedule)),
                  const SizedBox(width: 20),
                  Expanded(child: _CalendarCard(items: calendar)),
                ],
              ),
      ],
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final List<ScheduleItem> items;

  const _ScheduleCard({required this.items});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Horario semanal', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...items.map((item) => _ScheduleRow(item: item)),
        ],
      ),
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  final ScheduleItem item;

  const _ScheduleRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('${item.day} - ${item.time}', style: const TextStyle(fontWeight: FontWeight.w600)),
              const Spacer(),
              _StatusPill(label: item.modality, color: AppColors.teal),
            ],
          ),
          const SizedBox(height: 6),
          Text(item.course, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Text('${item.room} - ${item.teacher}', style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _CalendarCard extends StatelessWidget {
  final List<CalendarItem> items;

  const _CalendarCard({required this.items});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Calendario academico', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...items.map(
            (item) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: AppColors.surface,
                child: Text(item.date, style: const TextStyle(fontSize: 11)),
              ),
              title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(item.type, style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnrollmentSection extends StatelessWidget {
  final List<EnrollmentItem> items;
  final VoidCallback onAction;

  const _EnrollmentSection({required this.items, required this.onAction});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Matricula inteligente',
          subtitle: 'Oferta actualizada con cupos y horarios disponibles.',
        ),
        const SizedBox(height: 24),
        isNarrow
            ? Column(
                children: [
                  _EnrollmentList(items: items),
                  const SizedBox(height: 20),
                  _EnrollmentSummary(onAction: onAction),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _EnrollmentList(items: items)),
                  const SizedBox(width: 20),
                  Expanded(child: _EnrollmentSummary(onAction: onAction)),
                ],
              ),
      ],
    );
  }
}

class _EnrollmentList extends StatelessWidget {
  final List<EnrollmentItem> items;

  const _EnrollmentList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => _EnrollmentCard(item: item)).toList(),
    );
  }
}

class _EnrollmentCard extends StatelessWidget {
  final EnrollmentItem item;

  const _EnrollmentCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Expanded(
                child: Text(item.course, style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
              _StatusPill(label: item.status, color: _statusColor(item.status)),
            ],
          ),
          const SizedBox(height: 6),
          Text(item.schedule, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 6),
          Text('${item.credits} creditos - ${item.seats}',
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _EnrollmentSummary extends StatelessWidget {
  final VoidCallback onAction;

  const _EnrollmentSummary({required this.onAction});

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
            'Simulador de carga',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Carga recomendada: 22 a 26 creditos. Considera practicas y electivos.',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onAction,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.navyDark,
            ),
            child: const Text('Actualizar simulacion'),
          ),
        ],
      ),
    );
  }
}

class _GradesSection extends StatelessWidget {
  final List<String> periods;
  final String selectedPeriod;
  final ValueChanged<String?> onPeriodChanged;
  final List<GradeItem> items;

  const _GradesSection({
    required this.periods,
    required this.selectedPeriod,
    required this.onPeriodChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Calificaciones y progreso',
          subtitle: 'Seguimiento por periodo academico y avance acumulado.',
          trailing: DropdownButton<String>(
            value: selectedPeriod,
            onChanged: onPeriodChanged,
            items: periods
                .map((period) => DropdownMenuItem(value: period, child: Text(period)))
                .toList(),
          ),
        ),
        const SizedBox(height: 20),
        if (items.isEmpty)
          const Text('No hay registros para este periodo.')
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Materia')),
                DataColumn(label: Text('Creditos')),
                DataColumn(label: Text('Nota')),
                DataColumn(label: Text('Estado')),
              ],
              rows: items
                  .map(
                    (item) => DataRow(
                      cells: [
                        DataCell(Text(item.course)),
                        DataCell(Text(item.credits)),
                        DataCell(Text(item.grade)),
                        DataCell(_StatusPill(label: item.status, color: _statusColor(item.status))),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}

class _FinanceSection extends StatelessWidget {
  final List<StatItem> stats;
  final List<FinanceItem> items;
  final List<String> methods;

  const _FinanceSection({required this.stats, required this.items, required this.methods});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Finanzas y pagos',
          subtitle: 'Estado de cuenta, beneficios y planes disponibles.',
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: stats
              .map((item) => SizedBox(width: 240, child: StatCard(item: item)))
              .toList(),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Movimientos recientes', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              ...items.map(
                (item) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.concept, style: const TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text('Vence: ${item.dueDate}',
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      Text(item.amount, style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(width: 12),
                      _StatusPill(label: item.status, color: _statusColor(item.status)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: methods
              .map(
                (method) => Chip(
                  label: Text(method),
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

class _LibrarySection extends StatelessWidget {
  final List<LibraryItem> loans;
  final List<String> resources;

  const _LibrarySection({required this.loans, required this.resources});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Biblioteca digital',
          subtitle: 'Prestamos activos y recursos especializados.',
        ),
        const SizedBox(height: 24),
        isNarrow
            ? Column(
                children: [
                  _LibraryLoans(items: loans),
                  const SizedBox(height: 20),
                  _LibraryResources(items: resources),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _LibraryLoans(items: loans)),
                  const SizedBox(width: 20),
                  Expanded(child: _LibraryResources(items: resources)),
                ],
              ),
      ],
    );
  }
}

class _LibraryLoans extends StatelessWidget {
  final List<LibraryItem> items;

  const _LibraryLoans({required this.items});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Prestamos activos', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.menu_book_outlined, color: AppColors.navy),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                        Text(item.author, style: Theme.of(context).textTheme.bodySmall),
                        Text('Entrega: ${item.dueDate}', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  _StatusPill(label: item.status, color: _statusColor(item.status)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LibraryResources extends StatelessWidget {
  final List<String> items;

  const _LibraryResources({required this.items});

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
          Text('Recursos recomendados', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: items
                .map(
                  (item) => Chip(
                    label: Text(item),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: AppColors.border),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Accediendo a biblioteca digital...')));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.navy,
              foregroundColor: Colors.white,
            ),
            child: const Text('Explorar biblioteca'),
          ),
        ],
      ),
    );
  }
}

class _DocumentsSection extends StatelessWidget {
  final List<DocumentItem> documents;
  final List<TicketItem> tickets;
  final List<String> procedures;

  const _DocumentsSection({
    required this.documents,
    required this.tickets,
    required this.procedures,
  });

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Documentos y tramites',
          subtitle: 'Solicitudes, tickets y certificados en seguimiento.',
        ),
        const SizedBox(height: 24),
        isNarrow
            ? Column(
                children: [
                  _DocumentList(items: documents),
                  const SizedBox(height: 20),
                  _TicketList(items: tickets),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _DocumentList(items: documents)),
                  const SizedBox(width: 20),
                  Expanded(child: _TicketList(items: tickets)),
                ],
              ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: procedures
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

class _DocumentList extends StatelessWidget {
  final List<DocumentItem> items;

  const _DocumentList({required this.items});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Solicitudes activas', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.description_outlined, color: AppColors.navy),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                        Text('Actualizado: ${item.updated}',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  _StatusPill(label: item.status, color: _statusColor(item.status)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TicketList extends StatelessWidget {
  final List<TicketItem> items;

  const _TicketList({required this.items});

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
          Text('Tickets de soporte', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.support_agent_outlined, color: AppColors.navy),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                        Text('${item.area} - ${item.updated}',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  _StatusPill(label: item.status, color: _statusColor(item.status)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationsSection extends StatelessWidget {
  final List<NotificationItem> items;
  final bool notifyEmail;
  final bool notifyWhatsapp;
  final bool notifyApp;
  final ValueChanged<bool> onEmailChanged;
  final ValueChanged<bool> onWhatsappChanged;
  final ValueChanged<bool> onAppChanged;

  const _NotificationsSection({
    required this.items,
    required this.notifyEmail,
    required this.notifyWhatsapp,
    required this.notifyApp,
    required this.onEmailChanged,
    required this.onWhatsappChanged,
    required this.onAppChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Notificaciones y preferencias',
          subtitle: 'Alertas para que no pierdas ningun evento importante.',
        ),
        const SizedBox(height: 24),
        isNarrow
            ? Column(
                children: [
                  _NotificationList(items: items),
                  const SizedBox(height: 20),
                  _PreferencePanel(
                    notifyEmail: notifyEmail,
                    notifyWhatsapp: notifyWhatsapp,
                    notifyApp: notifyApp,
                    onEmailChanged: onEmailChanged,
                    onWhatsappChanged: onWhatsappChanged,
                    onAppChanged: onAppChanged,
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _NotificationList(items: items)),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _PreferencePanel(
                      notifyEmail: notifyEmail,
                      notifyWhatsapp: notifyWhatsapp,
                      notifyApp: notifyApp,
                      onEmailChanged: onEmailChanged,
                      onWhatsappChanged: onWhatsappChanged,
                      onAppChanged: onAppChanged,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}

class _NotificationList extends StatelessWidget {
  final List<NotificationItem> items;

  const _NotificationList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.surface,
                    child: const Icon(Icons.notifications_outlined, color: AppColors.navy),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(item.message, style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            _StatusPill(label: item.category, color: AppColors.sky),
                            const SizedBox(width: 8),
                            Text(item.time, style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
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

class _PreferencePanel extends StatelessWidget {
  final bool notifyEmail;
  final bool notifyWhatsapp;
  final bool notifyApp;
  final ValueChanged<bool> onEmailChanged;
  final ValueChanged<bool> onWhatsappChanged;
  final ValueChanged<bool> onAppChanged;

  const _PreferencePanel({
    required this.notifyEmail,
    required this.notifyWhatsapp,
    required this.notifyApp,
    required this.onEmailChanged,
    required this.onWhatsappChanged,
    required this.onAppChanged,
  });

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
          Text('Canales de alerta', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: notifyEmail,
            activeColor: AppColors.teal,
            onChanged: onEmailChanged,
            title: const Text('Correo institucional'),
            subtitle: const Text('Avisos de notas y matricula'),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: notifyWhatsapp,
            activeColor: AppColors.teal,
            onChanged: onWhatsappChanged,
            title: const Text('WhatsApp'),
            subtitle: const Text('Recordatorios rapidos'),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: notifyApp,
            activeColor: AppColors.teal,
            onChanged: onAppChanged,
            title: const Text('Notificaciones push'),
            subtitle: const Text('Alertas en tiempo real'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Preferencias guardadas')));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.navy,
              foregroundColor: Colors.white,
            ),
            child: const Text('Guardar preferencias'),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusPill({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

Color _statusColor(String status) {
  final key = status.toLowerCase();
  if (key.contains('pendiente')) return AppColors.gold;
  if (key.contains('programado')) return AppColors.sky;
  if (key.contains('descuento')) return AppColors.teal;
  if (key.contains('aprobado')) return AppColors.teal;
  if (key.contains('curso')) return AppColors.sky;
  if (key.contains('limitado')) return AppColors.gold;
  if (key.contains('lista')) return AppColors.gold;
  if (key.contains('abierto')) return AppColors.sky;
  if (key.contains('proceso')) return AppColors.gold;
  if (key.contains('cerrado')) return AppColors.teal;
  if (key.contains('listo')) return AppColors.teal;
  if (key.contains('revision')) return AppColors.gold;
  if (key.contains('enviado')) return AppColors.sky;
  return AppColors.navy;
}
