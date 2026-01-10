import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Responsive utilities for adaptive layouts
class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppTheme.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppTheme.mobileBreakpoint &&
      MediaQuery.of(context).size.width < AppTheme.tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

  static double contentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > AppTheme.maxContentWidth) {
      return AppTheme.maxContentWidth;
    }
    return width;
  }

  static EdgeInsets sectionPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingMd,
        vertical: AppTheme.spacingXl,
      );
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingXl,
        vertical: AppTheme.spacingXxl,
      );
    }
    return const EdgeInsets.symmetric(
      horizontal: AppTheme.spacingXxl,
      vertical: AppTheme.spacingSection,
    );
  }

  static double headingSize(BuildContext context) {
    if (isMobile(context)) return 32;
    if (isTablet(context)) return 40;
    return 48;
  }

  static double heroTitleSize(BuildContext context) {
    if (isMobile(context)) return 36;
    if (isTablet(context)) return 48;
    return 56;
  }

  static int gridCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }

  static double gridChildAspectRatio(BuildContext context) {
    if (isMobile(context)) return 1.5;
    if (isTablet(context)) return 1.2;
    return 1.1;
  }
}

/// Widget that builds different layouts based on screen size
class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return desktop;
    } else if (Responsive.isTablet(context)) {
      return tablet ?? desktop;
    }
    return mobile;
  }
}

/// Constrained content wrapper for consistent max-width
class ContentContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;

  const ContentContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? AppTheme.maxContentWidth,
        ),
        padding: padding ?? Responsive.sectionPadding(context),
        child: child,
      ),
    );
  }
}
