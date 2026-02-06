import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'widgets/app_shell.dart';

class AcademicPortalApp extends StatelessWidget {
  const AcademicPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Academico Pro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AppShell(),
    );
  }
}
