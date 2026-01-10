import '../models/portfolio_models.dart';

/// Static data for the portfolio
/// Replace with your actual information
class PortfolioData {
  PortfolioData._();

  // Personal Info
  static const String name = 'Azis Fardiansyah';
  static const String role = 'Web & Android Developer';
  static const String tagline = 'Building Robust Business Systems';
  static const String heroSubtitle =
      'Bridging technology and business processes through reliable web and mobile solutions, with expertise in SAP MM & WM implementation.';

  // About
  static const String aboutDescription = '''
Saya adalah seorang developer dengan pengalaman dalam membangun aplikasi web dan Android yang fokus pada stabilitas dan skalabilitas sistem. Latar belakang saya sebagai konsultan SAP MM (Material Management) dan WM (Warehouse Management) memberikan perspektif unik dalam memahami proses bisnis dan kebutuhan operasional industri.

Pendekatan saya dalam pengembangan software selalu berorientasi pada proses bisnis, bukan hanya fitur teknis. Saya percaya bahwa aplikasi yang baik adalah yang mampu menyelesaikan masalah nyata dan terintegrasi dengan sistem bisnis yang ada.
''';

  static const String aboutFocus =
      'Fokus pada sistem bisnis, integrasi proses, dan stabilitas aplikasi jangka panjang.';

  // Skills
  static const List<SkillCategory> technicalSkills = [
    SkillCategory(
      title: 'Web Development',
      description: 'Modern web applications with focus on performance',
      skills: [
        'Flutter Web',
        'HTML/CSS/JavaScript',
        'React',
        'REST API Integration',
        'Responsive Design',
      ],
    ),
    SkillCategory(
      title: 'Android Development',
      description: 'Native and cross-platform mobile solutions',
      skills: [
        'Flutter',
        'Kotlin',
        'Android SDK',
        'Material Design',
        'Firebase',
      ],
    ),
    SkillCategory(
      title: 'Backend & Integration',
      description: 'Server-side development and system integration',
      skills: [
        'Node.js',
        'Python',
        'PostgreSQL',
        'MySQL',
        'REST/SOAP APIs',
        'Firebase',
      ],
    ),
  ];

  static const List<SkillCategory> businessSkills = [
    SkillCategory(
      title: 'SAP MM (Material Management)',
      description: 'Procurement and inventory processes',
      skills: [
        'Procurement Process',
        'Vendor Management',
        'Purchase Orders',
        'Goods Receipt',
        'Invoice Verification',
        'Material Master',
      ],
    ),
    SkillCategory(
      title: 'SAP WM (Warehouse Management)',
      description: 'Warehouse operations and logistics',
      skills: [
        'Storage Location Management',
        'Goods Movement',
        'Transfer Orders',
        'Inventory Management',
        'Picking Strategies',
        'Warehouse Structure',
      ],
    ),
    SkillCategory(
      title: 'Business Process',
      description: 'End-to-end business understanding',
      skills: [
        'Process Mapping',
        'Requirements Analysis',
        'System Integration',
        'User Training',
        'Documentation',
        'Change Management',
      ],
    ),
    SkillCategory(
      title: 'SAP Development',
      description: 'Custom ABAP development and integration',
      skills: [
        'T-Code Z / Custom',
        'BAPI Development',
        'RFC Integration',
        'ABAP Programming',
        'Enhancement & User Exit',
        'SAP Query & Report',
      ],
    ),
  ];

  // Experience
  static const List<Experience> experiences = [
    Experience(
      title: 'SAP MM/WM Consultant',
      company: 'Manufacturing & Distribution Industries',
      period: '2020 - Present',
      description:
          'Implementasi dan support sistem SAP untuk modul Material Management dan Warehouse Management di berbagai industri manufaktur dan distribusi.',
      responsibilities: [
        'Analisis kebutuhan bisnis dan mapping proses procurement',
        'Konfigurasi SAP MM untuk procurement cycle end-to-end',
        'Setup dan optimasi warehouse structure di SAP WM',
        'Integrasi antara modul MM-WM-FI-CO',
        'Training end-user dan dokumentasi sistem',
        'Support Go-Live dan troubleshooting operasional',
      ],
      technologies: ['SAP ECC', 'SAP S/4HANA', 'ABAP Debugging'],
      type: ExperienceType.sapConsultant,
    ),
    Experience(
      title: 'Web & Android Developer',
      company: 'Various Projects',
      period: '2018 - Present',
      description:
          'Pengembangan aplikasi web dan mobile untuk berbagai kebutuhan bisnis dengan fokus pada sistem yang terintegrasi dan reliable.',
      responsibilities: [
        'Pengembangan aplikasi Flutter untuk web dan mobile',
        'Integrasi dengan backend services dan third-party APIs',
        'Implementasi business logic sesuai requirement proses',
        'Optimasi performa dan user experience',
        'Maintenance dan enhancement aplikasi existing',
        'Kolaborasi dengan tim untuk delivery on-time',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST API',
        'PostgreSQL',
        'Git',
        'Pocketbase',
        'BAPI/OData Services'
      ],
      type: ExperienceType.developer,
    ),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      title: 'Inventory Management System',
      businessContext: 'Warehouse Operations',
      description:
          'Sistem manajemen inventory untuk tracking barang masuk-keluar dengan integrasi barcode scanning dan real-time stock updates.',
      technologies: ['Flutter',
      'BAPI','SAP RFC', 'Firebase', 'REST API', 'Barcode Scanner'],
      role: 'Full-stack Developer',
      impact: 'Mengurangi waktu proses inventory checking hingga 60%',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Procurement Dashboard',
      businessContext: 'Supply Chain Management',
      description:
          'Dashboard web untuk monitoring proses procurement mulai dari PR hingga PO dengan visualisasi status dan analytics.',
      technologies: ['Flutter Web','BAPI', 'PostgreSQL', 'REST API', 'Charts'],
      role: 'Frontend Developer',
      impact: 'Visibility procurement process meningkat untuk management',
      category: ProjectCategory.web,
    ),
    Project(
      title: 'SAP Integration Middleware',
      businessContext: 'System Integration',
      description:
          'Middleware untuk integrasi data antara aplikasi mobile dengan SAP menggunakan RFC dan BAPI calls.',
      technologies: ['Node.js', 'SAP RFC', 'BAPI', 'REST API'],
      role: 'Integration Developer',
      impact: 'Real-time sync data antara mobile app dan SAP ECC',
      category: ProjectCategory.integration,
    ),
    Project(
      title: 'Delivery Tracking App',
      businessContext: 'Logistics & Distribution',
      description:
          'Aplikasi mobile untuk driver delivery dengan GPS tracking, proof of delivery, dan sync dengan sistem warehouse.',
      technologies: [
        'Flutter',
        'Google Maps',
        'Firebase',
        'Camera API',
        'PocketBase',
        'REST API',
        'BAPI',
        'SAP RFC'
        ],
      role: 'Mobile Developer',
      impact: 'Tracking delivery real-time dan dokumentasi digital',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Fuel Consumption & Purchase Control System',
      businessContext: 'Fleet Management & Cost Control',
      description:
          'Sistem aplikasi untuk monitoring pembelian dan konsumsi BBM armada, '
          'dengan validasi lokasi SPBU, pencatatan odometer, foto bukti transaksi, '
          'serta integrasi data untuk analisis biaya operasional.',
      technologies: [
        'Flutter',
        'PocketBase',
        'REST API',
        'GPS',
        'BAPI'
        'Camera API',
      ],
      role: 'Fullstack Mobile Developer & System Analyst',
      impact:
          'Efisiensi biaya operasional armada, data BBM terstruktur, '
          'dan dasar analisis untuk pengambilan keputusan manajemen.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Aplikasi Sistem Perkreditan Barang',
      businessContext: 'Retail Financing & Micro Finance',
      description:
          'Aplikasi Android untuk pengelolaan kredit barang dengan simulasi cicilan, '
          'pencatatan pembayaran, monitoring sisa angsuran, serta laporan keuangan. '
          'Mendukung multi-role user (Sysadmin, Admin, Konsumen) dengan kontrol akses berbeda.',
      technologies: [
        'Flutter',
        'PocketBase',
        'Firebase Cloud Messaging',
        'QR Code',
        'Camera API',
        'Local Storage'
      ],
      role: 'Mobile App Developer & System Designer',
      impact:
          'Proses kredit lebih transparan, pencatatan transaksi rapi, '
          'meminimalkan kesalahan manual, dan meningkatkan kontrol keuangan bisnis',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Foaming Production Monitoring App',
      businessContext: 'Manufacturing & SAP Integration',
      description:
          'Aplikasi Android untuk pencatatan dan monitoring proses produksi foaming di pabrik, '
          'mulai dari input hasil produksi, konsumsi bahan baku, reject produksi, hingga sinkronisasi '
          'data ke SAP MM & WM secara real-time atau batch.',
      technologies: [
        'Flutter',
        'SAP OData / RFC',
        'REST API',
        'PocketBase / Firebase',
        'Android Camera API'
      ],
      role: 'Android Developer & SAP MM/WM Consultant',
      impact:
          'Produksi foaming lebih terkontrol, data akurat tanpa input manual di SAP, '
          'mengurangi selisih stok bahan baku dan mempercepat pelaporan produksi.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Vendor Return Management App',
      businessContext: 'Logistics, Procurement & Reverse Supply Chain',
      description:
          'Aplikasi mobile & web untuk mengelola proses retur barang dari vendor ekspedisi, mulai dari pelaporan retur, verifikasi kondisi barang, pelacakan status retur, hingga integrasi dengan sistem gudang dan keuangan.',
      technologies: [
        'Flutter',
        'REST API',
        'PocketBase / Firebase',
        'Camera API',
        'QR Code Scanner',
        'GPS & Timestamp'
      ],
      role: 'Fullstack Mobile Developer & System Designer',
      impact:
          'Mempercepat proses retur barang, meningkatkan akurasi data retur, mengurangi dispute dengan vendor ekspedisi, dan menyediakan audit trail digital end-to-end.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Various Other Projects',
      businessContext: 'Multi-Industry Solutions',
      description:
          'Selain project yang ditampilkan, saya juga mengerjakan banyak project lain di berbagai domain seperti manufaktur, keuangan, logistik, dan internal tools perusahaan. '
          'Beberapa di antaranya bersifat private, internal, atau dilindungi NDA.',
      technologies: [
        'Flutter',
        'Android Native',
        'Web App',
        'REST API',
        'Firebase',
        'PocketBase',
        'SAP Integration'
      ],
      role: 'Full Stack Developer & SAP Consultant',
      impact:
          'Membantu digitalisasi proses bisnis, meningkatkan efisiensi operasional, dan mempercepat pengambilan keputusan.',
      category: ProjectCategory.general,
    ),
  ];

  // Value Propositions
  static const List<ValueProposition> valuePropositions = [
    ValueProposition(
      title: 'Business Process Understanding',
      description:
          'Bukan sekadar membuat UI, tapi memahami alur bisnis di baliknya. Background SAP memberikan insight mendalam tentang proses procurement, warehouse, dan supply chain.',
      icon: 'business',
    ),
    ValueProposition(
      title: 'System-Oriented Development',
      description:
          'Fokus pada bagaimana aplikasi terintegrasi dengan sistem yang ada. Pengembangan yang memikirkan data flow, validasi bisnis, dan konsistensi transaksi.',
      icon: 'integration',
    ),
    ValueProposition(
      title: 'Industrial Experience',
      description:
          'Pengalaman langsung di industri manufaktur dan distribusi. Memahami kebutuhan operasional tim gudang, procurement, dan manajemen.',
      icon: 'factory',
    ),
    ValueProposition(
      title: 'Reliable Solutions',
      description:
          'Prioritas pada stabilitas dan maintainability. Aplikasi yang tidak hanya berfungsi hari ini, tapi tetap reliable untuk jangka panjang.',
      icon: 'reliability',
    ),
  ];

  // Tech Stack
  static const Map<String, List<String>> techStack = {
    'Frontend': ['Flutter', 'React', 'HTML/CSS', 'JavaScript', 'Dart'],
    'Backend': ['Node.js', 'Python', 'Express', 'FastAPI'],
    'Database': ['PostgreSQL', 'MySQL', 'Firebase Firestore', 'SQLite', 'PocketBase'],
    'Integration': ['REST API', 'SAP RFC/BAPI', 'SOAP', 'Firebase', 'OData'],
    'DevOps': ['Git', 'GitHub', 'Firebase Hosting', 'Vercel'],
    'SAP': ['SAP MM', 'SAP WM', 'ABAP Debugging', 'SAP Fiori', 'T-Code Z / Custom'],
  };

  // Contact
  static const List<ContactInfo> contactInfo = [
    ContactInfo(
      type: 'Email',
      value: 'azizfardiansyah@gmail.com',
      url: 'mailto:azizfardiansyah@gmail.com',
      icon: 'email',
    ),
    ContactInfo(
      type: 'LinkedIn',
      value: 'linkedin.com/in/azizfardiansyah',
      url: 'https://linkedin.com/in/azizfardiansyah',
      icon: 'linkedin',
    ),
    ContactInfo(
      type: 'GitHub',
      value: 'github.com/azizfardiansyah',
      url: 'https://github.com/azizfardiansyah',
      icon: 'github',
    ),
    ContactInfo(
      type: 'WhatsApp',
      value: '+62 821-1881-2077',
      url: 'https://wa.me/6282118812077',
      icon: 'whatsapp',
    ),
  ];

  // CTA
  static const String ctaTitle = 'Mari Diskusi Project Anda';
  static const String ctaDescription =
      'Butuh aplikasi yang memahami proses bisnis Anda? Atau integrasi dengan sistem SAP? Hubungi saya untuk diskusi lebih lanjut.';
}
