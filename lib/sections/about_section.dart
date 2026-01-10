import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../widgets/common_widgets.dart';
import '../data/portfolio_data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionId: 'about',
      backgroundColor: AppTheme.surfaceWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Tentang Saya',
            subtitle: 'Developer dengan perspektif bisnis',
          ),
          
          ResponsiveBuilder(
            mobile: _buildMobileLayout(context),
            desktop: _buildDesktopLayout(context),
          ),
          
          SizedBox(height: isMobile ? AppTheme.spacingLg : AppTheme.spacingXl),
          
          // Focus highlight
          FadeInWidget(
            delay: const Duration(milliseconds: 400),
            child: Container(
              padding: const EdgeInsets.all(AppTheme.spacingLg),
              decoration: BoxDecoration(
                color: AppTheme.backgroundLight,
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                border: Border.all(color: AppTheme.divider),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: AppTheme.accentColor,
                    size: 24,
                  ),
                  const SizedBox(width: AppTheme.spacingMd),
                  Expanded(
                    child: Text(
                      PortfolioData.aboutFocus,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInWidget(
          delay: const Duration(milliseconds: 200),
          child: _buildProfileImage(context),
        ),
        const SizedBox(height: AppTheme.spacingLg),
        FadeInWidget(
          delay: const Duration(milliseconds: 300),
          child: _buildDescription(context),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInWidget(
          delay: const Duration(milliseconds: 200),
          child: _buildProfileImage(context),
        ),
        const SizedBox(width: AppTheme.spacingXxl),
        Expanded(
          child: FadeInWidget(
            delay: const Duration(milliseconds: 300),
            child: _buildDescription(context),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = isMobile ? 150.0 : 200.0;
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.primaryGray,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.cardShadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        child: Image.asset(
          'assets/images/profile.png',
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback jika gambar tidak ditemukan
            return Center(
              child: Icon(
                Icons.person,
                size: size * 0.5,
                color: AppTheme.lightGray,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioData.aboutDescription,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.8,
          ),
        ),
        const SizedBox(height: AppTheme.spacingLg),
        
        // Key highlights
        Wrap(
          spacing: AppTheme.spacingMd,
          runSpacing: AppTheme.spacingMd,
          children: [
            _buildHighlight(context, 'SAP Consulting', Icons.business_center_outlined),
            _buildHighlight(context, 'Full-stack Dev', Icons.code_outlined),
            _buildHighlight(context, 'Business Focus', Icons.trending_up_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildHighlight(BuildContext context, String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingMd,
        vertical: AppTheme.spacingSm,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primaryBlack),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppTheme.primaryBlack),
          const SizedBox(width: AppTheme.spacingSm),
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppTheme.primaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}
