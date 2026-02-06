import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../theme/app_theme.dart';
import '../widgets/info_card.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/program_card.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';

class ProgramsScreen extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const ProgramsScreen({super.key, required this.onNavigate});

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
                title: 'Oferta academica',
                subtitle: 'Programas con enfoque practico y rutas flexibles.',
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  SizedBox(
                    width: 280,
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Buscar programa',
                      ),
                    ),
                  ),
                  ...AppData.programFilters
                      .map(
                        (filter) => Chip(
                          label: Text(filter),
                          backgroundColor: filter == 'Todos' ? AppColors.navy : AppColors.surface,
                          labelStyle: TextStyle(
                            color: filter == 'Todos' ? Colors.white : AppColors.navy,
                            fontWeight: FontWeight.w600,
                          ),
                          side: const BorderSide(color: AppColors.border),
                        ),
                      )
                      .toList(),
                ],
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 340,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.82,
                ),
                itemCount: AppData.programs.length,
                itemBuilder: (context, index) {
                  final program = AppData.programs[index];
                  return ProgramCard(
                    program: program,
                    onPlan: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Descargando plan de ${program.name}...')),
                      );
                    },
                  );
                },
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
                title: 'Rutas de aprendizaje',
                subtitle: 'Trayectorias pensadas para distintas metas profesionales.',
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  InfoCard(
                    icon: Icons.auto_graph_outlined,
                    title: 'Ruta ejecutiva',
                    description: 'Programa intensivo con certificaciones empresariales.',
                    color: AppColors.teal,
                  ),
                  InfoCard(
                    icon: Icons.memory_outlined,
                    title: 'Ruta tecnologica',
                    description: 'Especializaciones en IA, datos y ciberseguridad.',
                    color: AppColors.sky,
                  ),
                  InfoCard(
                    icon: Icons.palette_outlined,
                    title: 'Ruta creativa',
                    description: 'Proyectos interdisciplinarios y portafolio profesional.',
                    color: AppColors.gold,
                  ),
                ],
              ),
            ],
          ),
        ),
        SectionContainer(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(20),
            ),
            child: isNarrow
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Explora el portal de servicios academicos',
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Gestiona tramites, consultas y recursos digitales desde un solo lugar.',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => onNavigate(AppNavIndex.services),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gold,
                          foregroundColor: AppColors.navy,
                        ),
                        child: const Text('Ir a servicios'),
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
                              'Explora el portal de servicios academicos',
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Gestiona tramites, consultas y recursos digitales desde un solo lugar.',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => onNavigate(AppNavIndex.services),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gold,
                          foregroundColor: AppColors.navy,
                        ),
                        child: const Text('Ir a servicios'),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
