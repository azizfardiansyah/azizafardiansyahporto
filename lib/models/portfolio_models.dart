/// Data models for portfolio content
library;

class SkillCategory {
  final String title;
  final String description;
  final List<String> skills;
  final String? icon;

  const SkillCategory({
    required this.title,
    required this.description,
    required this.skills,
    this.icon,
  });
}

class Experience {
  final String title;
  final String company;
  final String period;
  final String? location;
  final String description;
  final List<String> responsibilities;
  final List<String>? technologies;
  final ExperienceType type;

  const Experience({
    required this.title,
    required this.company,
    required this.period,
    this.location,
    required this.description,
    required this.responsibilities,
    this.technologies,
    required this.type,
  });
}

enum ExperienceType {
  sapConsultant,
  developer,
}

class Project {
  final String title;
  final String businessContext;
  final String description;
  final List<String> technologies;
  final String role;
  final String? impact;
  final String? imageUrl;
  final String? projectUrl;
  final ProjectCategory category;

  const Project({
    required this.title,
    required this.businessContext,
    required this.description,
    required this.technologies,
    required this.role,
    this.impact,
    this.imageUrl,
    this.projectUrl,
    required this.category,
  });
}

enum ProjectCategory {
  web,
  mobile,
  integration,
  sapRelated,
  general,
}

class TechStackItem {
  final String name;
  final String category;
  final String? icon;

  const TechStackItem({
    required this.name,
    required this.category,
    this.icon,
  });
}

class ContactInfo {
  final String type;
  final String value;
  final String? url;
  final String icon;

  const ContactInfo({
    required this.type,
    required this.value,
    this.url,
    required this.icon,
  });
}

class ValueProposition {
  final String title;
  final String description;
  final String icon;

  const ValueProposition({
    required this.title,
    required this.description,
    required this.icon,
  });
}
