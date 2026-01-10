import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../widgets/common_widgets.dart';
import '../data/portfolio_data.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionId: 'techstack',
      backgroundColor: AppTheme.backgroundLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Tech Stack',
            subtitle: 'Teknologi yang saya gunakan sehari-hari',
          ),
          
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 2 : (Responsive.isTablet(context) ? 3 : 6);
              final spacing = AppTheme.spacingMd;
              final itemWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;
              
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: PortfolioData.techStack.entries.toList().asMap().entries.map((entry) {
                  final index = entry.key;
                  final category = entry.value.key;
                  final techs = entry.value.value;
                  return SizedBox(
                    width: itemWidth,
                    child: FadeInWidget(
                      delay: Duration(milliseconds: 200 + (index * 100)),
                      child: _buildTechCard(context, category, techs),
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

  Widget _buildTechCard(BuildContext context, String category, List<String> techs) {
    return InfoCard(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                _getCategoryIcon(category),
                size: 18,
                color: AppTheme.accentColor,
              ),
              const SizedBox(width: AppTheme.spacingSm),
              Expanded(
                child: Text(
                  category,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppTheme.accentColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSm),
          const Divider(),
          const SizedBox(height: AppTheme.spacingSm),
          ...techs.map((tech) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingXs),
              child: Text(
                '• $tech',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          }),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'frontend':
        return Icons.web_outlined;
      case 'backend':
        return Icons.dns_outlined;
      case 'database':
        return Icons.storage_outlined;
      case 'integration':
        return Icons.sync_alt_outlined;
      case 'devops':
        return Icons.rocket_launch_outlined;
      case 'sap':
        return Icons.business_outlined;
      default:
        return Icons.code_outlined;
    }
  }
}
