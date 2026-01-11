import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../data/portfolio_data.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    const yearRange = '2018–2026';

    return Container(
      width: double.infinity,
      color: AppTheme.primaryBlack,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppTheme.spacingMd : AppTheme.spacingXxl,
        vertical: AppTheme.spacingLg,
      ),
      child: Column(
        children: [
          const Divider(color: AppTheme.primaryGray, thickness: 1),
          const SizedBox(height: AppTheme.spacingLg),
          
          ResponsiveBuilder(
            mobile: _buildMobileFooter(context, yearRange),
            desktop: _buildDesktopFooter(context, yearRange),
          ),
          
          const SizedBox(height: AppTheme.spacingMd),
        ],
      ),
    );
  }

  Widget _buildMobileFooter(BuildContext context, String yearRange) {
    return Column(
      children: [
        // Name and role
        Text(
          PortfolioData.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppTheme.textLight,
          ),
        ),
        const SizedBox(height: AppTheme.spacingXs),
        Text(
          PortfolioData.role,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.lightGray,
          ),
        ),
        const SizedBox(height: AppTheme.spacingMd),
        
        // Copyright
        Text(
          '© $yearRange ${PortfolioData.name}. All rights reserved.',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppTheme.secondaryGray,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppTheme.spacingXs),
        Text(
          'Built with Flutter Web',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppTheme.secondaryGray,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopFooter(BuildContext context, String yearRange) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppTheme.spacingLg,
      runSpacing: AppTheme.spacingMd,
      children: [
        // Left side - Name and role
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              PortfolioData.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppTheme.textLight,
              ),
            ),
            const SizedBox(width: AppTheme.spacingMd),
            Container(
              width: 1,
              height: 20,
              color: AppTheme.primaryGray,
            ),
            const SizedBox(width: AppTheme.spacingMd),
            Text(
              PortfolioData.role,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.lightGray,
              ),
            ),
          ],
        ),
        
        // Right side - Copyright
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '© $yearRange ${PortfolioData.name}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppTheme.secondaryGray,
              ),
            ),
            const SizedBox(width: AppTheme.spacingMd),
            Text(
              '•',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppTheme.secondaryGray,
              ),
            ),
            const SizedBox(width: AppTheme.spacingMd),
            Text(
              'Built with Flutter Web',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppTheme.secondaryGray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
