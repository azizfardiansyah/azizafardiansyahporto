import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../widgets/common_widgets.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionId: 'experience',
      backgroundColor: AppTheme.surfaceWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Pengalaman',
            subtitle: 'Kombinasi konsultan SAP dan developer',
          ),
          
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: PortfolioData.experiences.length,
            separatorBuilder: (context, index) => 
                const SizedBox(height: AppTheme.spacingLg),
            itemBuilder: (context, index) {
              return FadeInWidget(
                delay: Duration(milliseconds: 200 + (index * 150)),
                child: _buildExperienceCard(
                  context,
                  PortfolioData.experiences[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, Experience experience) {
    final isMobile = Responsive.isMobile(context);
    final isSapRole = experience.type == ExperienceType.sapConsultant;
    
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingSm),
                decoration: BoxDecoration(
                  color: isSapRole 
                      ? AppTheme.accentColor.withValues(alpha: 0.1)
                      : AppTheme.primaryBlack.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Icon(
                  isSapRole ? Icons.business_center : Icons.code,
                  color: isSapRole ? AppTheme.accentColor : AppTheme.primaryBlack,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppTheme.spacingMd),
              
              // Title & Company
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppTheme.spacingXs),
                    Text(
                      experience.company,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Period badge
              if (!isMobile)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingMd,
                    vertical: AppTheme.spacingSm,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundLight,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  child: Text(
                    experience.period,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
            ],
          ),
          
          if (isMobile) ...[
            const SizedBox(height: AppTheme.spacingSm),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
                vertical: AppTheme.spacingSm,
              ),
              decoration: BoxDecoration(
                color: AppTheme.backgroundLight,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              ),
              child: Text(
                experience.period,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
          
          const SizedBox(height: AppTheme.spacingMd),
          
          // Description
          Text(
            experience.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          
          const SizedBox(height: AppTheme.spacingMd),
          
          // Responsibilities
          Text(
            'Tanggung Jawab:',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: AppTheme.spacingSm),
          
          ...experience.responsibilities.map((responsibility) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacingSm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.check,
                      size: 16,
                      color: AppTheme.accentColor,
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingSm),
                  Expanded(
                    child: Text(
                      responsibility,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          
          // Technologies
          if (experience.technologies != null && 
              experience.technologies!.isNotEmpty) ...[
            const SizedBox(height: AppTheme.spacingMd),
            Wrap(
              spacing: AppTheme.spacingXs,
              runSpacing: AppTheme.spacingXs,
              children: experience.technologies!
                  .map((tech) => SkillChip(label: tech, isPrimary: true))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
