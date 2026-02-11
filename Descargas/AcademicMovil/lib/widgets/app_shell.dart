import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../screens/about_screen.dart';
import '../screens/admissions_screen.dart';
import '../screens/admissions_login_screen.dart';
import '../screens/campus_life_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/home_screen.dart';
import '../screens/portal_screen.dart';
import '../screens/programs_screen.dart';
import '../screens/research_screen.dart';
import '../screens/services_screen.dart';
import '../theme/app_theme.dart';
import 'portal_top_bar.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = AppNavIndex.home;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(onNavigate: _onSelect),
      const AboutScreen(),
      ProgramsScreen(onNavigate: _onSelect),
      PortalScreen(onNavigate: _onSelect),
      const AdmissionsScreen(),
      const ResearchScreen(),
      const CampusLifeScreen(),
      ServicesScreen(onNavigate: _onSelect),
      const ContactScreen(),
    ];
  }

  void _onSelect(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);
  }

  void _openAdmissionsLogin(BuildContext context) {
    _onSelect(AppNavIndex.admissions);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AdmissionsLoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.of(context).size.width < 1024;

    return Scaffold(
      drawer: isCompact ? Drawer(child: _buildDrawer(context)) : null,
      body: Column(
        children: [
          Builder(
            builder: (context) => PortalTopBar(
              items: AppData.navigationItems,
              selectedIndex: _selectedIndex,
              onSelect: _onSelect,
              isCompact: isCompact,
              onMenuTap: isCompact ? () => Scaffold.of(context).openDrawer() : null,
              onPrimaryAction: () => _openAdmissionsLogin(context),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              child: KeyedSubtree(
                key: ValueKey(_selectedIndex),
                child: _pages[_selectedIndex],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == AppNavIndex.home
          ? FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Asesoria en linea'),
                    content: const Text(
                      'Un asesor academico respondera en breve. Tambien puedes agendar una llamada.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.navyDark,
              icon: const Icon(Icons.support_agent_outlined),
              label: const Text('Hablar con asesor'),
            )
          : null,
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset('web/images/IntegraSystems.png', height: 32),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    AppData.campusName,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: AppData.navigationItems.length,
              itemBuilder: (context, index) {
                final item = AppData.navigationItems[index];
                return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.label),
                  selected: _selectedIndex == index,
                  onTap: () {
                    Navigator.pop(context);
                    _onSelect(index);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                _openAdmissionsLogin(context);
              },
              icon: const Icon(Icons.how_to_reg_outlined),
              label: const Text('Iniciar postulacion'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navy,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
