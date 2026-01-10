import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../widgets/common_widgets.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionId: 'skills',
      backgroundColor: AppTheme.backgroundLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Keahlian',
            subtitle: 'Kombinasi skill teknis dan pemahaman proses bisnis',
          ),
          
          // Technical Skills
          FadeInWidget(
            delay: const Duration(milliseconds: 200),
            child: _buildSkillGroup(
              context,
              'Technical Skills',
              Icons.code_outlined,
              PortfolioData.technicalSkills,
            ),
          ),
          
          SizedBox(height: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxl),
          
          // SAP & Business Process
          FadeInWidget(
            delay: const Duration(milliseconds: 400),
            child: _buildSkillGroup(
              context,
              'SAP & Business Process',
              Icons.business_outlined,
              PortfolioData.businessSkills,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillGroup(
    BuildContext context,
    String groupTitle,
    IconData icon,
    List<SkillCategory> categories,
  ) {
    final isMobile = Responsive.isMobile(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 24, color: AppTheme.accentColor),
            const SizedBox(width: AppTheme.spacingSm),
            Text(
              groupTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.accentColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingLg),
        
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : (Responsive.isTablet(context) ? 2 : 3),
            crossAxisSpacing: AppTheme.spacingMd,
            mainAxisSpacing: AppTheme.spacingMd,
            childAspectRatio: isMobile ? 2.2 : 1.4,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildSkillCard(context, categories[index]);
          },
        ),
      ],
    );
  }

  Widget _buildSkillCard(BuildContext context, SkillCategory category) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppTheme.spacingXs),
          Text(
            category.description,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppTheme.spacingMd),
          Expanded(
            child: Wrap(
              spacing: AppTheme.spacingXs,
              runSpacing: AppTheme.spacingXs,
              children: category.skills
                  .map((skill) => SkillChip(label: skill))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
