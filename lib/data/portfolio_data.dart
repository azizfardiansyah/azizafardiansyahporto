import '../models/portfolio_models.dart';

/// Static data for the portfolio
/// Replace with your actual information
class PortfolioData {
  PortfolioData._();

  // Personal Info
  static const String name = 'Azis Fardiansyah';
  static const String role = 'Technical Project Manager & Solution Architect';
  static const String tagline = 'Bridging Business Problems to Technology Solutions';
  static const String sapHook = 'Bridging the gap between legacy systems and modern mobile experiences';
  static const String heroSubtitle =
      'Menganalisis masalah bisnis, merancang solusi teknologi, dan mengeksekusi dengan pendekatan AI-Assisted Development untuk hasil yang efisien dan berkualitas.';

  // About
  static const String aboutDescription = '''
Saya adalah jembatan antara masalah bisnis dan solusi teknologi. Dengan latar belakang sebagai konsultan SAP MM/WM dan pengalaman dalam pengembangan aplikasi, saya memahami bahwa teknologi hanyalah alat — yang terpenting adalah memecahkan masalah nyata.

Pendekatan saya: Analisis mendalam terhadap pain points bisnis, perancangan solusi yang terukur, dan eksekusi menggunakan AI-Assisted Development untuk mempercepat delivery tanpa mengorbankan kualitas. Di era 2026, memanfaatkan AI bukan kelemahan — itu adalah efisiensi.
''';

  static const String aboutFocus =
      'Fokus pada analisis masalah bisnis, perancangan solusi, dan eksekusi efisien dengan AI-Assisted Development.';

  // Skills
  static const List<SkillCategory> technicalSkills = [
    SkillCategory(
      title: 'AI-Assisted Development',
      description: 'Leveraging AI for efficient & quality delivery',
      skills: [
        'AI Pair Programming',
        'Rapid Prototyping with AI',
        'Code Review & Optimization',
        'Business Logic Generation',
        'Documentation Automation',
      ],
    ),
    SkillCategory(
      title: 'Solution Architecture',
      description: 'Designing scalable business solutions',
      skills: [
        'Requirements Analysis',
        'System Design',
        'Integration Architecture',
        'Database Design',
        'API Design',
      ],
    ),
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
        'Dart',
        'Android SDK',
        'Material Design',
        'Firebase',
      ],
    ),
    SkillCategory(
      title: 'Backend & Integration',
      description: 'Server-side development and system integration',
      skills: [
        'BAPI/OData Services',
        'Python',
        'PostgreSQL',
        'RFC Integration',
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
      period: '2015 - Present',
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
        'RFC Integration',
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
      problem:
          'Klien mengalami inefisiensi 40% pada proses stock opname karena pencatatan manual dan keterlambatan sinkronisasi data dengan SAP.',
      analysisSolution:
          'Saya menganalisis alur kerja warehouse dan merancang solusi mobile-first dengan barcode scanning. Menggunakan AI-Assisted Development untuk mempercepat prototyping dan mengimplementasikan offline-first architecture dengan queue system untuk mengatasi koneksi tidak stabil.',
      technologies: ['Flutter', 'BAPI', 'SAP RFC', 'Firebase', 'REST API','PostgreSQL', 'Barcode Scanner'],
      role: 'Solution Architect & Full-stack Developer',
      impact: 'Waktu proses inventory checking berkurang 60%, dari 5 jam menjadi 2 jam per cycle.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Procurement Dashboard',
      businessContext: 'Supply Chain Management',
      problem:
          'Management kesulitan memantau status procurement secara real-time. Laporan manual memakan waktu 2 hari dan sering outdated.',
      analysisSolution:
          'Menganalisis kebutuhan visibility management dan merancang dashboard dengan visualisasi real-time. Menggunakan AI untuk optimasi query dan implementasi data caching, pagination, serta lazy loading untuk handle data besar dari SAP.',
      technologies: ['Flutter Web', 'BAPI', 'PostgreSQL', 'REST API','RFC/OData Services', 'Charts'],
      role: 'Solution Architect & Frontend Developer',
      impact: 'Visibility procurement meningkat 100%, laporan tersedia real-time tanpa proses manual.',
      category: ProjectCategory.web,
    ),
    Project(
      title: 'SAP Integration Middleware',
      businessContext: 'System Integration',
      problem:
          'Aplikasi mobile tidak bisa berkomunikasi langsung dengan SAP, menyebabkan data entry ganda dan inkonsistensi data.',
      analysisSolution:
          'Merancang middleware layer yang menjembatani format data modern dengan SAP RFC/BAPI. Membangun layer transformasi data yang robust dengan comprehensive logging. AI membantu dalam debugging dan optimasi error handling.',
      technologies: ['Node.js', 'SAP RFC', 'BAPI', 'REST API'],
      role: 'Integration Architect & Developer',
      impact: 'Real-time sync antara mobile app dan SAP ECC, eliminasi data entry ganda.',
      category: ProjectCategory.integration,
    ),
    Project(
      title: 'Delivery Tracking App',
      businessContext: 'Logistics & Distribution',
      problem:
          'Tidak ada visibility terhadap posisi driver dan status delivery. Customer complaint tinggi karena ketidakpastian waktu kedatangan.',
      analysisSolution:
          'Menganalisis pain points logistik dan merancang solusi GPS tracking dengan proof of delivery. Implementasi adaptive location tracking yang menyesuaikan interval berdasarkan kecepatan untuk optimasi baterai. AI-Assisted dalam prototyping UI/UX.',
      technologies: ['Flutter', 'Google Maps', 'Firebase', 'Camera API', 'PocketBase', 'REST API', 'BAPI', 'SAP RFC'],
      role: 'Solution Architect & Mobile Developer',
      impact: 'Customer complaint turun 70%, ETA accuracy meningkat dari 40% menjadi 85%.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Fuel Consumption & Purchase Control System',
      businessContext: 'Fleet Management & Cost Control',
      problem:
          'Potensi kecurangan BBM tinggi karena tidak ada validasi. Biaya operasional armada sulit dikontrol dan dianalisis.',
      analysisSolution:
          'Merancang sistem dengan geofencing SPBU terverifikasi, mandatory photo capture dengan metadata, dan anomaly detection untuk pola konsumsi tidak wajar. AI membantu analisis pola data untuk deteksi fraud.',
      technologies: ['Flutter', 'PocketBase', 'REST API', 'GPS', 'BAPI', 'Camera API'],
      role: 'System Analyst & Fullstack Developer',
      impact: 'Penghematan biaya BBM 15-20% melalui deteksi dan pencegahan penyalahgunaan.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Aplikasi Sistem Perkreditan Barang',
      businessContext: 'Retail Financing & Micro Finance',
      problem:
          'Pencatatan kredit manual rentan error, kesulitan tracking pembayaran, dan sering terjadi kelalaian follow-up jatuh tempo.',
      analysisSolution:
          'Membangun calculation engine fleksibel untuk berbagai skema bunga dan cicilan. Implementasi scheduled notification dengan reminder bertingkat. AI-Assisted Development untuk mempercepat pembuatan business logic kompleks.',
      technologies: ['Flutter', 'PocketBase', 'Firebase Cloud Messaging', 'QR Code', 'Camera API', 'Local Storage'],
      role: 'System Designer & Mobile Developer',
      impact: 'Kesalahan pencatatan turun 90%, tingkat keterlambatan pembayaran berkurang 35%.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Foaming Production Monitoring App',
      businessContext: 'Manufacturing & SAP Integration',
      problem:
          'Input produksi manual ke SAP memakan waktu lama, sering terjadi selisih stok bahan baku, dan pelaporan produksi terlambat.',
      analysisSolution:
          'Menganalisis kondisi pabrik (panas, debu, operator non-tech) dan merancang UI ultra-sederhana dengan tombol besar dan validasi ketat. Sinkronisasi otomatis ke SAP MM & WM. AI membantu optimasi form validation logic.',
      technologies: ['Flutter', 'SAP OData / RFC', 'REST API', 'PocketBase / Firebase', 'Android Camera API'],
      role: 'SAP MM/WM Consultant & Android Developer',
      impact: 'Pelaporan produksi real-time, selisih stok bahan baku berkurang 80%.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Vendor Return Management App',
      businessContext: 'Logistics, Procurement & Reverse Supply Chain',
      problem:
          'Proses retur barang tidak terstruktur, sering terjadi dispute dengan vendor ekspedisi, dan tidak ada audit trail yang jelas.',
      analysisSolution:
          'Merancang state machine untuk workflow retur multi-pihak (gudang, vendor, finance) dengan approval berlapis. Push notification untuk setiap stakeholder dan audit trail digital end-to-end.',
      technologies: ['Flutter', 'REST API', 'PocketBase / Firebase', 'Camera API', 'QR Code Scanner', 'GPS & Timestamp'],
      role: 'System Designer & Fullstack Developer',
      impact: 'Dispute dengan vendor turun 60%, waktu proses retur berkurang dari 7 hari menjadi 2 hari.',
      category: ProjectCategory.mobile,
    ),
    Project(
      title: 'Various Other Projects',
      businessContext: 'Multi-Industry Solutions',
      problem:
          'Berbagai klien di industri manufaktur, keuangan, dan logistik menghadapi masalah digitalisasi proses yang berbeda-beda.',
      analysisSolution:
          'Pendekatan konsultatif: memahami business process sebelum coding, iterasi cepat dengan feedback end-user. AI-Assisted Development memungkinkan delivery lebih cepat untuk setiap kebutuhan unik.',
      technologies: ['Flutter', 'Android Native', 'Web App', 'REST API', 'Firebase', 'PocketBase', 'SAP Integration'],
      role: 'Solution Architect & Full Stack Developer',
      impact: 'Digitalisasi berhasil untuk berbagai proses bisnis, efisiensi operasional meningkat rata-rata 40%.',
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
