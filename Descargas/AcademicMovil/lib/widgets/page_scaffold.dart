import 'package:flutter/material.dart';

import 'site_footer.dart';

class PageScaffold extends StatelessWidget {
  final List<Widget> children;

  const PageScaffold({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...children,
          const SizedBox(height: 40),
          const SiteFooter(),
        ],
      ),
    );
  }
}
