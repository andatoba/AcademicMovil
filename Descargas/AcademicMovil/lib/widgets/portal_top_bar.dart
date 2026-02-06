import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../models/portal_models.dart';
import '../theme/app_theme.dart';

class PortalTopBar extends StatelessWidget {
  final List<NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final bool isCompact;
  final VoidCallback? onMenuTap;
  final VoidCallback? onPrimaryAction;

  const PortalTopBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelect,
    required this.isCompact,
    this.onMenuTap,
    this.onPrimaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.navy, AppColors.navyDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              if (isCompact)
                IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.menu, color: Colors.white),
                ),
              Image.asset('web/images/IntegraSystems.png', height: 32),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  AppData.campusName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              if (!isCompact)
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        items.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: TextButton(
                            onPressed: () => onSelect(index),
                            style: TextButton.styleFrom(
                              foregroundColor: selectedIndex == index
                                  ? AppColors.gold
                                  : Colors.white70,
                            ),
                            child: Text(
                              items[index].label,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: onPrimaryAction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: AppColors.navyDark,
                ),
                child: Text(isCompact ? 'Postular' : 'Postular 2025'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
