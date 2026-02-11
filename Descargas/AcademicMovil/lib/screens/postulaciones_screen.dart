import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/section_container.dart';

const String _admissionFormUrl = 'https://forms.gle/BS4eQTpuYqkQG6978';

class PostulacionesScreen extends StatefulWidget {
  const PostulacionesScreen({super.key});

  @override
  State<PostulacionesScreen> createState() => _PostulacionesScreenState();
}

class _PostulacionesScreenState extends State<PostulacionesScreen> {
  int _selectedIndex = 0;

  Future<void> _openAdmissionForm() async {
    final uri = Uri.parse(_admissionFormUrl);
    final ok = await launchUrl(uri, mode: LaunchMode.platformDefault);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir la encuesta.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 900;
    final program = _postulacionPrograms[_selectedIndex];

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: PageScaffold(
        children: [
          SectionContainer(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            child: isNarrow
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _PostulacionesMenu(
                        programs: _postulacionPrograms,
                        selectedIndex: _selectedIndex,
                        onSelect: (index) => setState(() => _selectedIndex = index),
                      ),
                      const SizedBox(height: 20),
                      _PostulacionDetail(
                        program: program,
                        onOpenForm: _openAdmissionForm,
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _PostulacionesMenu(
                          programs: _postulacionPrograms,
                          selectedIndex: _selectedIndex,
                          onSelect: (index) => setState(() => _selectedIndex = index),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2,
                        child: _PostulacionDetail(
                          program: program,
                          onOpenForm: _openAdmissionForm,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _PostulacionesMenu extends StatelessWidget {
  final List<_PostulacionProgram> programs;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const _PostulacionesMenu({
    required this.programs,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Postulaciones', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Selecciona el programa para revisar los detalles y completar la admision.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          ...List.generate(
            programs.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _MenuOption(
                program: programs[index],
                isSelected: index == selectedIndex,
                onTap: () => onSelect(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuOption extends StatelessWidget {
  final _PostulacionProgram program;
  final bool isSelected;
  final VoidCallback onTap;

  const _MenuOption({
    required this.program,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected ? AppColors.navy : Colors.white;
    final textColor = isSelected ? Colors.white : AppColors.navy;
    final iconColor = isSelected ? Colors.white : program.accentColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? AppColors.navy : AppColors.border),
        boxShadow: isSelected ? AppTheme.softShadow : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(program.icon, color: iconColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    program.title,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostulacionDetail extends StatelessWidget {
  final _PostulacionProgram program;
  final VoidCallback onOpenForm;

  const _PostulacionDetail({
    required this.program,
    required this.onOpenForm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(program.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(program.description, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                program.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const ColoredBox(
                    color: AppColors.surface,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const ColoredBox(
                    color: AppColors.surface,
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.mutedText,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onOpenForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gold,
                foregroundColor: AppColors.navyDark,
                minimumSize: const Size(double.infinity, 52),
              ),
              icon: const Icon(Icons.assignment_outlined),
              label: const Text('Responder preguntas de admision'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PostulacionProgram {
  final String title;
  final String description;
  final String imageUrl;
  final IconData icon;
  final Color accentColor;

  const _PostulacionProgram({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.icon,
    required this.accentColor,
  });
}

const List<_PostulacionProgram> _postulacionPrograms = [
  _PostulacionProgram(
    title: 'Diplomado Finanzas Internacionales',
    description:
        'Domina analisis financiero global, comercio exterior y gestion de riesgo.',
    imageUrl:
        'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&w=1200&q=80',
    icon: Icons.account_balance_outlined,
    accentColor: AppColors.gold,
  ),
  _PostulacionProgram(
    title: 'Maestria en estadistica',
    description: 'Profundiza en modelado estadistico, inferencia y analitica aplicada.',
    imageUrl:
        'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1200&q=80',
    icon: Icons.bar_chart_outlined,
    accentColor: AppColors.sky,
  ),
  _PostulacionProgram(
    title: 'Maestria en Business Intelligent aplicado a la IA',
    description: 'Integra BI con inteligencia artificial para decisiones estrategicas.',
    imageUrl:
        'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=1200&q=80',
    icon: Icons.auto_graph_outlined,
    accentColor: AppColors.teal,
  ),
  _PostulacionProgram(
    title: 'Certificado Data Analytic & Business Intelligent',
    description: 'Ruta intensiva para analisis de datos y visualizacion ejecutiva.',
    imageUrl:
        'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1200&q=80',
    icon: Icons.analytics_outlined,
    accentColor: AppColors.navy,
  ),
];
