import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../theme/app_theme.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: Colors.white70);

    return Container(
      width: double.infinity,
      color: AppColors.navyDark,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 40,
                runSpacing: 24,
                children: [
                  SizedBox(
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'web/images/IntegraSystems.png',
                              height: 36,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              AppData.campusName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Formamos lideres con vision global y compromiso local.',
                          style: textStyle,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Icon(Icons.public, color: Colors.white70, size: 20),
                            SizedBox(width: 12),
                            Icon(Icons.camera_alt_outlined, color: Colors.white70, size: 20),
                            SizedBox(width: 12),
                            Icon(Icons.alternate_email_outlined, color: Colors.white70, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Accesos rapidos',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 12),
                        Text('Admisiones', style: textStyle),
                        const SizedBox(height: 8),
                        Text('Calendario academico', style: textStyle),
                        const SizedBox(height: 8),
                        Text('Becas y financiamiento', style: textStyle),
                        const SizedBox(height: 8),
                        Text('Portal de servicios', style: textStyle),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contacto',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 12),
                        ...AppData.contactItems.map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Icon(item.icon, color: Colors.white70, size: 18),
                                const SizedBox(width: 10),
                                Expanded(child: Text(item.value, style: textStyle)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(color: Colors.white24),
              const SizedBox(height: 16),
              Text(
                '© 2025 ${AppData.campusName}. Todos los derechos reservados.',
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
