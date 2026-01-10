import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../widgets/common_widgets.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onContactTap;
  final VoidCallback? onProjectsTap;

  const HeroSection({
    super.key,
    this.onContactTap,
    this.onProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.surfaceWhite,
            AppTheme.backgroundLight,
          ],
        ),
      ),
      child: ContentContainer(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppTheme.spacingMd : AppTheme.spacingXxl,
          vertical: isMobile ? AppTheme.spacingXxl : AppTheme.spacingSection,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxl),
            
            // Role badge
            FadeInWidget(
              delay: const Duration(milliseconds: 100),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingMd,
                  vertical: AppTheme.spacingSm,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlack,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Text(
                  PortfolioData.role.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppTheme.textLight,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: AppTheme.spacingLg),
            
            // Name
            FadeInWidget(
              delay: const Duration(milliseconds: 200),
              child: Text(
                PortfolioData.name,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: Responsive.heroTitleSize(context),
                ),
              ),
            ),
            
            const SizedBox(height: AppTheme.spacingMd),
            
            // Tagline
            FadeInWidget(
              delay: const Duration(milliseconds: 300),
              child: Text(
                PortfolioData.tagline,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.accentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: isMobile ? 20 : (isTablet ? 24 : 28),
                ),
              ),
            ),
            
            const SizedBox(height: AppTheme.spacingLg),
            
            // Subtitle
            FadeInWidget(
              delay: const Duration(milliseconds: 400),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 700,
                ),
                child: Text(
                  PortfolioData.heroSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isMobile ? 16 : 18,
                    height: 1.7,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: AppTheme.spacingXl),
            
            // SAP Experience badges
            FadeInWidget(
              delay: const Duration(milliseconds: 500),
              child: Wrap(
                spacing: AppTheme.spacingSm,
                runSpacing: AppTheme.spacingSm,
                children: [
                  _buildExperienceBadge(context, 'SAP MM', Icons.inventory_2_outlined),
                  _buildExperienceBadge(context, 'SAP WM', Icons.warehouse_outlined),
                  _buildExperienceBadge(context, 'Flutter', Icons.phone_android_outlined),
                  _buildExperienceBadge(context, 'Web', Icons.language_outlined),
                ],
              ),
            ),
            
            SizedBox(height: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxl),
            
            // CTA buttons
            FadeInWidget(
              delay: const Duration(milliseconds: 600),
              child: Wrap(
                spacing: AppTheme.spacingMd,
                runSpacing: AppTheme.spacingMd,
                children: [
                  PrimaryButton(
                    text: 'Lihat Portfolio',
                    icon: Icons.arrow_forward,
                    onPressed: onProjectsTap,
                  ),
                  SecondaryButton(
                    text: 'Hubungi Saya',
                    icon: Icons.mail_outline,
                    onPressed: onContactTap,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxl),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceBadge(BuildContext context, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingMd,
        vertical: AppTheme.spacingSm,
      ),
      decoration: BoxDecoration(
        color: AppTheme.surfaceWhite,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppTheme.textSecondary),
          const SizedBox(width: AppTheme.spacingSm),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
