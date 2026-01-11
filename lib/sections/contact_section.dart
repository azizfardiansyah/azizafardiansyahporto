// ignore_for_file: deprecated_member_use, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../widgets/common_widgets.dart';
import '../data/portfolio_data.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void _launchUrl(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionId: 'contact',
      backgroundColor: AppTheme.primaryBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CTA Header
          FadeInWidget(
            delay: const Duration(milliseconds: 200),
            child: Text(
              PortfolioData.ctaTitle,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppTheme.textLight,
                fontSize: Responsive.headingSize(context),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          SizedBox(height: isMobile ? AppTheme.spacingMd : AppTheme.spacingLg),
          
          FadeInWidget(
            delay: const Duration(milliseconds: 300),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                PortfolioData.ctaDescription,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.lightGray,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          SizedBox(height: isMobile ? AppTheme.spacingXl : AppTheme.spacingXxl),
          
          // Contact cards
          FadeInWidget(
            delay: const Duration(milliseconds: 400),
            child: Wrap(
              spacing: AppTheme.spacingMd,
              runSpacing: AppTheme.spacingMd,
              alignment: WrapAlignment.center,
              children: PortfolioData.contactInfo
                  .map((contact) => _buildContactCard(context, contact))
                  .toList(),
            ),
          ),
          
          SizedBox(height: isMobile ? AppTheme.spacingLg : AppTheme.spacingXl),
          
          // Availability & Services
          FadeInWidget(
            delay: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingLg,
                    vertical: AppTheme.spacingMd,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    border: Border.all(color: AppTheme.accentColor.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingMd),
                      Text(
                        'Available for Freelance & Consultancy',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppTheme.spacingMd),
                // Services offered
                Wrap(
                  spacing: AppTheme.spacingSm,
                  runSpacing: AppTheme.spacingSm,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildServiceChip(context, 'SAP MM/WM Implementation'),
                    _buildServiceChip(context, 'Mobile App Development'),
                    _buildServiceChip(context, 'System Integration'),
                    _buildServiceChip(context, 'Business Process Analysis'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, dynamic contact) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (contact.icon == 'email') {
            // Copy email to clipboard
            Clipboard.setData(ClipboardData(text: contact.value));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${contact.value} berhasil disalin!'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'Buka Email',
                  onPressed: () => _launchUrl('mailto:${contact.value}'),
                ),
              ),
            );
          } else if (contact.url != null) {
            _launchUrl(contact.url);
          }
        },
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingLg,
            vertical: AppTheme.spacingMd,
          ),
          decoration: BoxDecoration(
            color: AppTheme.primaryDark,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(color: AppTheme.primaryGray),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getContactIcon(contact.icon),
                color: AppTheme.lightGray,
                size: 20,
              ),
              const SizedBox(width: AppTheme.spacingMd),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    contact.type,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppTheme.lightGray,
                    ),
                  ),
                  Text(
                    contact.value,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (contact.icon == 'email') ...[
                const SizedBox(width: AppTheme.spacingMd),
                Icon(
                  Icons.touch_app,
                  color: AppTheme.accentColor.withOpacity(0.7),
                  size: 16,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  IconData _getContactIcon(String iconName) {
    switch (iconName) {
      case 'email':
        return Icons.mail_outline;
      case 'linkedin':
        return Icons.link;
      case 'github':
        return Icons.code;
      case 'whatsapp':
        return Icons.chat_bubble_outline;
      default:
        return Icons.contact_mail_outlined;
    }
  }

  Widget _buildServiceChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingMd,
        vertical: AppTheme.spacingSm,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryGray.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryGray),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppTheme.lightGray,
        ),
      ),
    );
  }
}
