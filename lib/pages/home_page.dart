import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/responsive.dart';
import '../data/portfolio_data.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/value_section.dart';
import '../sections/techstack_section.dart';
import '../sections/contact_section.dart';
import '../sections/footer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isScrolled = false;
  int _activeSection = 0;

  // Section keys for navigation
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _valueKey = GlobalKey();
  final GlobalKey _techStackKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  final List<String> _navItems = [
    'Home',
    'About',
    'Skills',
    'Experience',
    'Portfolio',
    'Value',
    'Tech',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    
    // Update AppBar style
    if (offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }

    // Update active section
    _updateActiveSection();
  }

  void _updateActiveSection() {
    final keys = [
      _heroKey,
      _aboutKey,
      _skillsKey,
      _experienceKey,
      _projectsKey,
      _valueKey,
      _techStackKey,
      _contactKey,
    ];

    for (int i = keys.length - 1; i >= 0; i--) {
      final key = keys[i];
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          if (position.dy <= 150) {
            if (_activeSection != i) {
              setState(() => _activeSection = i);
            }
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  GlobalKey _getKeyForIndex(int index) {
    switch (index) {
      case 0:
        return _heroKey;
      case 1:
        return _aboutKey;
      case 2:
        return _skillsKey;
      case 3:
        return _experienceKey;
      case 4:
        return _projectsKey;
      case 5:
        return _valueKey;
      case 6:
        return _techStackKey;
      case 7:
        return _contactKey;
      default:
        return _heroKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context, isMobile),
      drawer: isMobile ? _buildDrawer(context) : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero Section
            Container(
              key: _heroKey,
              child: HeroSection(
                onContactTap: () => _scrollToSection(_contactKey),
                onProjectsTap: () => _scrollToSection(_projectsKey),
              ),
            ),

            // About Section
            Container(
              key: _aboutKey,
              child: const AboutSection(),
            ),

            // Skills Section
            Container(
              key: _skillsKey,
              child: const SkillsSection(),
            ),

            // Experience Section
            Container(
              key: _experienceKey,
              child: const ExperienceSection(),
            ),

            // Projects Section
            Container(
              key: _projectsKey,
              child: const ProjectsSection(),
            ),

            // Value Proposition Section
            Container(
              key: _valueKey,
              child: const ValueSection(),
            ),

            // Tech Stack Section
            Container(
              key: _techStackKey,
              child: const TechStackSection(),
            ),

            // Contact Section
            Container(
              key: _contactKey,
              child: const ContactSection(),
            ),

            // Footer
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isMobile) {
    return AppBar(
      backgroundColor: _isScrolled
          ? AppTheme.surfaceWhite.withValues(alpha: 0.95)
          : Colors.transparent,
      elevation: _isScrolled ? 1 : 0,
      toolbarHeight: 70,
      leadingWidth: isMobile ? 56 : 200,
      leading: isMobile
          ? IconButton(
              icon: Icon(
                Icons.menu,
                color: _isScrolled ? AppTheme.textPrimary : AppTheme.textPrimary,
              ),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: AppTheme.spacingLg),
              child: Center(
                child: Text(
                  PortfolioData.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
            ),
      actions: isMobile
          ? null
          : [
              // Navigation items wrapped in Flexible
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: _navItems.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final isActive = _activeSection == index;

                      return TextButton(
                        onPressed: () => _scrollToSection(_getKeyForIndex(index)),
                        style: TextButton.styleFrom(
                          foregroundColor: isActive
                              ? AppTheme.accentColor
                              : AppTheme.textSecondary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.spacingSm,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(width: AppTheme.spacingSm),
              
              // CTA Button
              Padding(
                padding: const EdgeInsets.only(right: AppTheme.spacingLg),
                child: ElevatedButton(
                  onPressed: () => _scrollToSection(_contactKey),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingMd,
                      vertical: AppTheme.spacingSm,
                    ),
                  ),
                  child: const Text('Hubungi Saya'),
                ),
              ),
            ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.surfaceWhite,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingLg),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PortfolioData.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          PortfolioData.role,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Navigation items
            Expanded(
              child: ListView.builder(
                itemCount: _navItems.length,
                itemBuilder: (context, index) {
                  final isActive = _activeSection == index;

                  return ListTile(
                    title: Text(
                      _navItems[index],
                      style: TextStyle(
                        color: isActive
                            ? AppTheme.accentColor
                            : AppTheme.textPrimary,
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                    leading: Icon(
                      _getNavIcon(index),
                      color: isActive
                          ? AppTheme.accentColor
                          : AppTheme.textSecondary,
                    ),
                    selected: isActive,
                    selectedTileColor: AppTheme.accentColor.withValues(alpha: 0.1),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(_getKeyForIndex(index));
                    },
                  );
                },
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _scrollToSection(_contactKey);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Hubungi Saya'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getNavIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.person_outline;
      case 2:
        return Icons.psychology_outlined;
      case 3:
        return Icons.work_outline;
      case 4:
        return Icons.folder_outlined;
      case 5:
        return Icons.star_outline;
      case 6:
        return Icons.code_outlined;
      case 7:
        return Icons.mail_outline;
      default:
        return Icons.circle_outlined;
    }
  }
}
