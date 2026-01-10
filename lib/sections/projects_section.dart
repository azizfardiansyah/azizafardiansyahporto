import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../widgets/common_widgets.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionId: 'projects',
      backgroundColor: AppTheme.backgroundLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Portfolio',
            subtitle: 'Project dengan konteks bisnis nyata',
          ),
          
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 1 : (Responsive.isTablet(context) ? 2 : 3);
              final spacing = AppTheme.spacingMd;
              final itemWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;
              
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: PortfolioData.projects.asMap().entries.map((entry) {
                  final index = entry.key;
                  final project = entry.value;
                  return SizedBox(
                    width: itemWidth,
                    child: FadeInWidget(
                      delay: Duration(milliseconds: 200 + (index * 100)),
                      child: _buildProjectCard(context, project),
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

  Widget _buildProjectCard(BuildContext context, Project project) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category badge and icon
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingSm),
                decoration: BoxDecoration(
                  color: _getCategoryColor(project.category).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Icon(
                  _getCategoryIcon(project.category),
                  color: _getCategoryColor(project.category),
                  size: 20,
                ),
              ),
              const SizedBox(width: AppTheme.spacingSm),
              Expanded(
                child: Text(
                  project.businessContext,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: _getCategoryColor(project.category),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingMd),
          
          // Title
          Text(
            project.title,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: AppTheme.spacingSm),
          
          // Description
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          
          const SizedBox(height: AppTheme.spacingMd),
          
          // Role
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.person_outline,
                size: 16,
                color: AppTheme.textMuted,
              ),
              const SizedBox(width: AppTheme.spacingXs),
              Expanded(
                child: Text(
                  project.role,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppTheme.spacingSm),
          
          // Impact
          if (project.impact != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.trending_up,
                  size: 16,
                  color: AppTheme.accentColor,
                ),
                const SizedBox(width: AppTheme.spacingXs),
                Expanded(
                  child: Text(
                    project.impact!,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppTheme.accentColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingMd),
          ],
          
          // Technologies
          Wrap(
            spacing: AppTheme.spacingXs,
            runSpacing: AppTheme.spacingXs,
            children: project.technologies
                .map((tech) => SkillChip(label: tech))
                .toList(),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.web:
        return AppTheme.accentColor;
      case ProjectCategory.mobile:
        return const Color(0xFF2E7D32);
      case ProjectCategory.integration:
        return const Color(0xFF7B1FA2);
      case ProjectCategory.sapRelated:
        return const Color(0xFFE65100);
      case ProjectCategory.general:
        return const Color(0xFF455A64);
    }
  }

  IconData _getCategoryIcon(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.web:
        return Icons.language;
      case ProjectCategory.mobile:
        return Icons.phone_android;
      case ProjectCategory.integration:
        return Icons.sync_alt;
      case ProjectCategory.sapRelated:
        return Icons.business;
      case ProjectCategory.general:
        return Icons.apps;
    }
  }
}
