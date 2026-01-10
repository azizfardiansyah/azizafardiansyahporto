import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../widgets/common_widgets.dart';
import '../data/portfolio_data.dart';

class ValueSection extends StatelessWidget {
  const ValueSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionId: 'value',
      backgroundColor: AppTheme.surfaceWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'Mengapa Bekerja Dengan Saya',
            subtitle: 'Keunikan yang membedakan dari developer lain',
            alignment: CrossAxisAlignment.center,
          ),
          
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 1 : (Responsive.isTablet(context) ? 2 : 4);
              final spacing = AppTheme.spacingMd;
              final itemWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;
              
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                alignment: WrapAlignment.center,
                children: PortfolioData.valuePropositions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final value = entry.value;
                  return SizedBox(
                    width: itemWidth,
                    child: FadeInWidget(
                      delay: Duration(milliseconds: 200 + (index * 100)),
                      child: _buildValueCard(context, value),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildValueCard(
    BuildContext context,
    dynamic value,
  ) {
    final isMobile = Responsive.isMobile(context);
    
    return InfoCard(
      child: isMobile
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlack,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  child: Icon(
                    _getIcon(value.icon),
                    color: AppTheme.textLight,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        value.title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: AppTheme.spacingXs),
                      Text(
                        value.description,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlack,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  child: Icon(
                    _getIcon(value.icon),
                    color: AppTheme.textLight,
                    size: 24,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingMd),
                Text(
                  value.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: AppTheme.spacingSm),
                Text(
                  value.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'business':
        return Icons.account_tree_outlined;
      case 'integration':
        return Icons.hub_outlined;
      case 'factory':
        return Icons.factory_outlined;
      case 'reliability':
        return Icons.verified_outlined;
      default:
        return Icons.star_outline;
    }
  }
}
