import 'package:flutter/material.dart';

import '../models/portal_models.dart';
import '../theme/app_theme.dart';

class AppNavIndex {
  static const int home = 0;
  static const int about = 1;
  static const int programs = 2;
  static const int portal = 3;
  static const int admissions = 4;
  static const int research = 5;
  static const int campusLife = 6;
  static const int services = 7;
  static const int contact = 8;
}

class AppData {
  static const String campusName = 'Academia M.I.T. CPANTA';
  static const String campusTagline = 'Portal academico integral';
  static const String heroTitle = 'Tu futuro comienza con una ruta clara';
  static const String heroSubtitle =
      'Programas acreditados, docentes certificados y un ecosistema digital pensado para acompanarte en cada etapa.';
  static const String heroImage =
      'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=1600&q=80';
  static const String campusMapImage =
      'https://images.unsplash.com/photo-1489515217757-5fd1be406fef?auto=format&fit=crop&w=1400&q=80';
  static const String visitImage =
      'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=1400&q=80';

  static const List<NavItem> navigationItems = [
    NavItem(label: 'Inicio', icon: Icons.home_outlined),
    NavItem(label: 'Nosotros', icon: Icons.groups_outlined),
    NavItem(label: 'Programas', icon: Icons.school_outlined),
    NavItem(label: 'Portal Academico', icon: Icons.dashboard_outlined),
    NavItem(label: 'Admisiones', icon: Icons.how_to_reg_outlined),
    NavItem(label: 'Investigacion', icon: Icons.science_outlined),
    NavItem(label: 'Vida Estudiantil', icon: Icons.diversity_3_outlined),
    NavItem(label: 'Servicios', icon: Icons.apps_outlined),
    NavItem(label: 'Contacto', icon: Icons.alternate_email_outlined),
  ];

  static const List<String> heroHighlights = [
    'Admisiones 2025 abiertas',
    'Becas del 40% disponibles',
    'Modalidades presencial e hibrida',
  ];

  static const StudentProfile studentProfile = StudentProfile(
    name: 'Andrea Valdez',
    id: '202410289',
    program: 'Ingenieria de Software',
    level: 'Pregrado',
    campus: 'Campus Norte',
    status: 'Activo',
    advisor: 'Mg. Juan Rojas',
    email: 'andrea.valdez@mitcpanta.edu',
    period: '2025-1',
    modality: 'Hibrido',
  );

  static const List<StatItem> portalStats = [
    StatItem(
      label: 'Creditos inscritos',
      value: '24',
      icon: Icons.menu_book_outlined,
      color: AppColors.sky,
    ),
    StatItem(
      label: 'Promedio actual',
      value: '8.9/10',
      icon: Icons.star_outline,
      color: AppColors.gold,
    ),
    StatItem(
      label: 'Asistencia',
      value: '96%',
      icon: Icons.verified_outlined,
      color: AppColors.teal,
    ),
    StatItem(
      label: 'Horas practicas',
      value: '120',
      icon: Icons.workspace_premium_outlined,
      color: AppColors.navy,
    ),
  ];

  static const List<ServiceItem> portalActions = [
    ServiceItem(
      title: 'Matricula en linea',
      description: 'Inscribe materias y valida tu carga.',
      icon: Icons.event_available_outlined,
      action: 'Ir a matricula',
      color: AppColors.sky,
    ),
    ServiceItem(
      title: 'Horario academico',
      description: 'Consulta aulas, docentes y modalidad.',
      icon: Icons.schedule_outlined,
      action: 'Ver horario',
      color: AppColors.teal,
    ),
    ServiceItem(
      title: 'Calificaciones',
      description: 'Notas parciales y cierre de periodo.',
      icon: Icons.grade_outlined,
      action: 'Ver notas',
      color: AppColors.gold,
    ),
    ServiceItem(
      title: 'Estado financiero',
      description: 'Pagos pendientes y planes activos.',
      icon: Icons.account_balance_wallet_outlined,
      action: 'Revisar',
      color: AppColors.navy,
    ),
    ServiceItem(
      title: 'Biblioteca digital',
      description: 'Prestamos, reservas y bases de datos.',
      icon: Icons.local_library_outlined,
      action: 'Abrir',
      color: AppColors.sky,
    ),
    ServiceItem(
      title: 'Documentos',
      description: 'Solicitudes y certificados listos.',
      icon: Icons.description_outlined,
      action: 'Solicitar',
      color: AppColors.teal,
    ),
  ];

  static const List<ScheduleItem> weeklySchedule = [
    ScheduleItem(
      day: 'Lunes',
      time: '08:00 - 10:00',
      course: 'Algoritmos y Estructuras',
      room: 'Lab B-201',
      teacher: 'Dra. P. Cruz',
      modality: 'Presencial',
    ),
    ScheduleItem(
      day: 'Lunes',
      time: '10:30 - 12:00',
      course: 'Calculo Multivariado',
      room: 'Aula 402',
      teacher: 'Ing. R. Medina',
      modality: 'Presencial',
    ),
    ScheduleItem(
      day: 'Martes',
      time: '14:00 - 16:00',
      course: 'Arquitectura de Software',
      room: 'Lab C-105',
      teacher: 'Mg. L. Quintero',
      modality: 'Hibrido',
    ),
    ScheduleItem(
      day: 'Miercoles',
      time: '09:00 - 11:00',
      course: 'Bases de Datos',
      room: 'Lab A-110',
      teacher: 'Ing. M. Diaz',
      modality: 'Presencial',
    ),
    ScheduleItem(
      day: 'Jueves',
      time: '16:00 - 18:00',
      course: 'Etica Profesional',
      room: 'Aula 301',
      teacher: 'Dra. S. Palma',
      modality: 'Virtual',
    ),
    ScheduleItem(
      day: 'Viernes',
      time: '08:00 - 10:00',
      course: 'Proyecto Integrador',
      room: 'Lab I-02',
      teacher: 'Ing. F. Lobo',
      modality: 'Presencial',
    ),
  ];

  static const List<CalendarItem> academicCalendar = [
    CalendarItem(
      date: '05 Abr',
      title: 'Inicio de clases',
      type: 'Academico',
    ),
    CalendarItem(
      date: '12 Abr',
      title: 'Entrega parcial 1',
      type: 'Evaluaciones',
    ),
    CalendarItem(
      date: '25 Abr',
      title: 'Cierre de matricula',
      type: 'Administrativo',
    ),
    CalendarItem(
      date: '10 May',
      title: 'Semana de innovacion',
      type: 'Eventos',
    ),
    CalendarItem(
      date: '28 May',
      title: 'Examenes finales',
      type: 'Academico',
    ),
  ];

  static const List<String> gradePeriods = [
    '2025-1',
    '2024-2',
    '2024-1',
  ];

  static const List<GradeItem> grades = [
    GradeItem(
      course: 'Algoritmos y Estructuras',
      period: '2025-1',
      grade: '9.1',
      status: 'Aprobado',
      credits: '4',
    ),
    GradeItem(
      course: 'Bases de Datos',
      period: '2025-1',
      grade: '8.7',
      status: 'Aprobado',
      credits: '4',
    ),
    GradeItem(
      course: 'Calculo Multivariado',
      period: '2025-1',
      grade: '8.4',
      status: 'En curso',
      credits: '4',
    ),
    GradeItem(
      course: 'Arquitectura de Software',
      period: '2024-2',
      grade: '9.3',
      status: 'Aprobado',
      credits: '3',
    ),
    GradeItem(
      course: 'Ingenieria de Requisitos',
      period: '2024-2',
      grade: '8.9',
      status: 'Aprobado',
      credits: '3',
    ),
    GradeItem(
      course: 'Calculo Integral',
      period: '2024-1',
      grade: '8.2',
      status: 'Aprobado',
      credits: '4',
    ),
  ];

  static const List<EnrollmentItem> enrollmentOffers = [
    EnrollmentItem(
      course: 'Ciberseguridad Aplicada',
      schedule: 'Mar/Jue 18:00-20:00',
      credits: '3',
      seats: '12 disponibles',
      status: 'Disponible',
    ),
    EnrollmentItem(
      course: 'Analitica con Python',
      schedule: 'Sab 08:00-12:00',
      credits: '4',
      seats: '3 disponibles',
      status: 'Cupo limitado',
    ),
    EnrollmentItem(
      course: 'UX Research',
      schedule: 'Lun/Mie 14:00-16:00',
      credits: '3',
      seats: 'Lista de espera',
      status: 'Lista de espera',
    ),
    EnrollmentItem(
      course: 'Gestion de Proyectos',
      schedule: 'Mar 10:00-12:00',
      credits: '2',
      seats: '18 disponibles',
      status: 'Disponible',
    ),
  ];

  static const List<FinanceItem> financeItems = [
    FinanceItem(
      concept: 'Matricula 2025-1',
      amount: '\$620.00',
      dueDate: '15 Abr',
      status: 'Pendiente',
    ),
    FinanceItem(
      concept: 'Seguro estudiantil',
      amount: '\$45.00',
      dueDate: '20 Abr',
      status: 'Pendiente',
    ),
    FinanceItem(
      concept: 'Laboratorio especializado',
      amount: '\$120.00',
      dueDate: '05 May',
      status: 'Programado',
    ),
    FinanceItem(
      concept: 'Beca aplicada',
      amount: '-\$200.00',
      dueDate: 'Aplicado',
      status: 'Descuento',
    ),
  ];

  static const List<StatItem> financeStats = [
    StatItem(
      label: 'Saldo actual',
      value: '\$585.00',
      icon: Icons.account_balance_outlined,
      color: AppColors.navy,
    ),
    StatItem(
      label: 'Proximo vencimiento',
      value: '15 Abr',
      icon: Icons.event_outlined,
      color: AppColors.sky,
    ),
    StatItem(
      label: 'Beca aplicada',
      value: '25%',
      icon: Icons.workspace_premium_outlined,
      color: AppColors.teal,
    ),
  ];

  static const List<String> paymentMethods = [
    'Tarjeta',
    'Transferencia',
    'Debito',
    'Convenio',
  ];

  static const List<LibraryItem> libraryLoans = [
    LibraryItem(
      title: 'Clean Code',
      author: 'Robert C. Martin',
      dueDate: '18 Abr',
      status: 'Activo',
    ),
    LibraryItem(
      title: 'Design Systems',
      author: 'Alla Kholmatova',
      dueDate: '22 Abr',
      status: 'Renovacion disponible',
    ),
    LibraryItem(
      title: 'Data Science Handbook',
      author: 'J. VanderPlas',
      dueDate: '02 May',
      status: 'Activo',
    ),
  ];

  static const List<String> digitalResources = [
    'IEEE Xplore',
    'SpringerLink',
    'Scopus',
    'Repositorio institucional',
  ];

  static const List<DocumentItem> documents = [
    DocumentItem(
      name: 'Certificado de matricula',
      status: 'Listo',
      updated: '08 Abr 2025',
    ),
    DocumentItem(
      name: 'Constancia de notas',
      status: 'En revision',
      updated: '06 Abr 2025',
    ),
    DocumentItem(
      name: 'Solicitud de beca',
      status: 'Enviado',
      updated: '04 Abr 2025',
    ),
    DocumentItem(
      name: 'Carta de pasantia',
      status: 'Pendiente',
      updated: '03 Abr 2025',
    ),
  ];

  static const List<TicketItem> tickets = [
    TicketItem(
      title: 'Actualizacion de datos',
      status: 'Abierto',
      updated: '09 Abr 2025',
      area: 'Registro',
    ),
    TicketItem(
      title: 'Soporte Aula Virtual',
      status: 'En proceso',
      updated: '08 Abr 2025',
      area: 'TI',
    ),
    TicketItem(
      title: 'Solicitud de homologacion',
      status: 'Cerrado',
      updated: '01 Abr 2025',
      area: 'Academico',
    ),
  ];

  static const List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Clase reprogramada',
      message: 'Arquitectura de Software se mueve a viernes 10:00.',
      time: 'Hace 2h',
      category: 'Horario',
    ),
    NotificationItem(
      title: 'Pago pendiente',
      message: 'Recuerda completar el pago de matricula antes del 15 Abr.',
      time: 'Ayer',
      category: 'Finanzas',
    ),
    NotificationItem(
      title: 'Nuevo recurso en biblioteca',
      message: 'Disponible la guia de Cloud Computing 2025.',
      time: 'Hace 2 dias',
      category: 'Biblioteca',
    ),
    NotificationItem(
      title: 'Encuesta docente',
      message: 'Evalua tus materias antes del 30 Abr.',
      time: 'Hace 4 dias',
      category: 'Academico',
    ),
  ];

  static const List<StatItem> stats = [
    StatItem(
      label: 'Programas activos',
      value: '48',
      icon: Icons.auto_awesome,
      color: AppColors.sky,
    ),
    StatItem(
      label: 'Docentes certificados',
      value: '220',
      icon: Icons.verified_outlined,
      color: AppColors.teal,
    ),
    StatItem(
      label: 'Convenios internacionales',
      value: '36',
      icon: Icons.public_outlined,
      color: AppColors.gold,
    ),
    StatItem(
      label: 'Empleabilidad 12 meses',
      value: '94%',
      icon: Icons.trending_up,
      color: AppColors.navy,
    ),
  ];

  static const List<StatItem> researchStats = [
    StatItem(
      label: 'Proyectos en curso',
      value: '28',
      icon: Icons.biotech_outlined,
      color: AppColors.sky,
    ),
    StatItem(
      label: 'Articulos indexados',
      value: '112',
      icon: Icons.menu_book_outlined,
      color: AppColors.teal,
    ),
    StatItem(
      label: 'Semilleros activos',
      value: '14',
      icon: Icons.groups_outlined,
      color: AppColors.gold,
    ),
  ];

  static const List<HighlightItem> highlights = [
    HighlightItem(
      title: 'Acreditacion global',
      description: 'Programas con aval internacional y doble titulacion.',
      icon: Icons.workspace_premium_outlined,
      color: AppColors.gold,
    ),
    HighlightItem(
      title: 'Campus inteligente',
      description: 'Laboratorios IoT, bibliotecas digitales y aulas XR.',
      icon: Icons.hub_outlined,
      color: AppColors.sky,
    ),
    HighlightItem(
      title: 'Mentoria 1 a 1',
      description: 'Acompanamiento academico con rutas personalizadas.',
      icon: Icons.support_agent_outlined,
      color: AppColors.teal,
    ),
    HighlightItem(
      title: 'Innovacion aplicada',
      description: 'Proyectos reales con empresas lideres del sector.',
      icon: Icons.lightbulb_outline,
      color: AppColors.navy,
    ),
  ];

  static const List<NewsItem> news = [
    NewsItem(
      title: 'Nuevo Centro de Analitica Educativa',
      summary: 'Lanzamos el hub de datos para mejorar el rendimiento estudiantil.',
      date: '05 Mar 2025',
      tag: 'Innovacion',
    ),
    NewsItem(
      title: 'Convenio con TechNova Labs',
      summary: 'Practicas profesionales garantizadas para carreras STEM.',
      date: '18 Feb 2025',
      tag: 'Alianzas',
    ),
    NewsItem(
      title: 'Semana Internacional 2025',
      summary: 'Invitados de 12 paises comparten tendencias educativas.',
      date: '27 Ene 2025',
      tag: 'Eventos',
    ),
  ];

  static const List<EventItem> events = [
    EventItem(
      title: 'Open House Virtual',
      date: '12 Abr 2025',
      location: 'Plataforma Live',
      category: 'Admisiones',
    ),
    EventItem(
      title: 'Feria de Empleo',
      date: '23 Abr 2025',
      location: 'Auditorio Principal',
      category: 'Carreras',
    ),
    EventItem(
      title: 'Hackaton Academico',
      date: '08 May 2025',
      location: 'Lab Innovacion',
      category: 'Innovacion',
    ),
    EventItem(
      title: 'Encuentro de Egresados',
      date: '29 May 2025',
      location: 'Campus Norte',
      category: 'Comunidad',
    ),
  ];

  static const List<TestimonialItem> testimonials = [
    TestimonialItem(
      name: 'Camila Torres',
      program: 'Ingenieria de Software',
      quote:
          'El plan de estudios esta alineado con lo que piden las empresas. Las practicas me abrieron puertas.',
      imageUrl: 'https://i.pravatar.cc/150?img=47',
    ),
    TestimonialItem(
      name: 'Luis Mendoza',
      program: 'Marketing Estrategico',
      quote:
          'Me gusto la mezcla entre teoria y proyectos reales. El equipo docente esta siempre disponible.',
      imageUrl: 'https://i.pravatar.cc/150?img=12',
    ),
    TestimonialItem(
      name: 'Sofia Herrera',
      program: 'Diseno Digital',
      quote:
          'Las mentorias personalizadas me ayudaron a construir un portafolio competitivo.',
      imageUrl: 'https://i.pravatar.cc/150?img=32',
    ),
  ];

  static const List<TimelineItem> timeline = [
    TimelineItem(
      year: '1995',
      title: 'Fundacion',
      description: 'Iniciamos con una vision de transformar la educacion local.',
    ),
    TimelineItem(
      year: '2010',
      title: 'Transformacion digital',
      description: 'Implementamos el primer campus virtual 100% integrado.',
    ),
    TimelineItem(
      year: '2024',
      title: 'Liderazgo regional',
      description: 'Reconocidos como referente en innovacion educativa.',
    ),
  ];

  static const List<LeaderItem> leaders = [
    LeaderItem(
      name: 'Dra. Maria Garcia',
      role: 'Rectora General',
      focus: 'Estrategia institucional y expansion academica.',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
    LeaderItem(
      name: 'Ing. Roberto Paz',
      role: 'Vicerrector de Innovacion',
      focus: 'Transformacion digital y alianzas tecnologicas.',
      imageUrl: 'https://i.pravatar.cc/150?img=11',
    ),
    LeaderItem(
      name: 'Dra. Luisa Vega',
      role: 'Directora de Bienestar',
      focus: 'Acompanamiento integral y vida estudiantil.',
      imageUrl: 'https://i.pravatar.cc/150?img=44',
    ),
  ];

  static const List<HighlightItem> values = [
    HighlightItem(
      title: 'Excelencia academica',
      description: 'Rigurosidad, evaluacion continua y mejora permanente.',
      icon: Icons.school_outlined,
      color: AppColors.navy,
    ),
    HighlightItem(
      title: 'Innovacion con impacto',
      description: 'Proyectos que resuelven desafios reales de la region.',
      icon: Icons.auto_fix_high_outlined,
      color: AppColors.sky,
    ),
    HighlightItem(
      title: 'Comunidad diversa',
      description: 'Respeto, inclusion y colaboracion global.',
      icon: Icons.diversity_2_outlined,
      color: AppColors.teal,
    ),
  ];

  static const List<String> accreditations = [
    'Consejo Internacional de Calidad Educativa',
    'Alianza Latinoamericana de Innovacion',
    'Red Global de Universidades Digitales',
    'Consorcio de Investigacion Aplicada',
  ];

  static const List<ProgramItem> programs = [
    ProgramItem(
      name: 'Ingenieria de Software',
      faculty: 'Facultad de Tecnologia',
      level: 'Pregrado',
      duration: '8 semestres',
      mode: 'Presencial / Hibrido',
      accreditation: 'Acreditacion ABET equivalente',
      tags: ['IA', 'Cloud', 'DevOps'],
    ),
    ProgramItem(
      name: 'Administracion de Empresas',
      faculty: 'Facultad de Negocios',
      level: 'Pregrado',
      duration: '8 semestres',
      mode: 'Presencial',
      accreditation: 'AACSB en proceso',
      tags: ['Finanzas', 'Gestion', 'Emprendimiento'],
    ),
    ProgramItem(
      name: 'Diseno Grafico Digital',
      faculty: 'Facultad Creativa',
      level: 'Pregrado',
      duration: '7 semestres',
      mode: 'Hibrido',
      accreditation: 'Adobe Creative Partner',
      tags: ['UX', 'Motion', 'Branding'],
    ),
    ProgramItem(
      name: 'Marketing Estrategico',
      faculty: 'Facultad de Negocios',
      level: 'Posgrado',
      duration: '4 semestres',
      mode: 'Online en vivo',
      accreditation: 'Certificacion AMA',
      tags: ['Growth', 'Data', 'Comercio'],
    ),
    ProgramItem(
      name: 'Ingenieria Ambiental',
      faculty: 'Facultad de Ciencias',
      level: 'Pregrado',
      duration: '9 semestres',
      mode: 'Presencial',
      accreditation: 'ISO 14001 Academy',
      tags: ['Sostenibilidad', 'Impacto', 'Campo'],
    ),
    ProgramItem(
      name: 'Analitica de Datos',
      faculty: 'Facultad de Tecnologia',
      level: 'Especializacion',
      duration: '2 semestres',
      mode: 'Hibrido',
      accreditation: 'Coursera Industry Path',
      tags: ['BI', 'Python', 'Insight'],
    ),
  ];

  static const List<String> programFilters = [
    'Todos',
    'Pregrado',
    'Posgrado',
    'Online',
    'STEM',
    'Creativos',
  ];

  static const List<AdmissionStepItem> admissionSteps = [
    AdmissionStepItem(
      title: 'Registro en linea',
      description: 'Completa el formulario con tus datos basicos y programa de interes.',
      timeline: 'Paso 1',
    ),
    AdmissionStepItem(
      title: 'Evaluacion academica',
      description: 'Revisamos tu historial, logros y perfil vocacional.',
      timeline: 'Paso 2',
    ),
    AdmissionStepItem(
      title: 'Entrevista orientadora',
      description: 'Sesiones personalizadas para definir tu ruta y becas.',
      timeline: 'Paso 3',
    ),
    AdmissionStepItem(
      title: 'Confirmacion y matricula',
      description: 'Reserva tu cupo y recibe el kit de bienvenida digital.',
      timeline: 'Paso 4',
    ),
  ];

  static const List<String> admissionRequirements = [
    'Copia de documento de identidad',
    'Certificado de notas o titulo anterior',
    'Formulario de postulacion completado',
    'Carta de motivacion o ensayo breve',
  ];

  static const List<HighlightItem> scholarships = [
    HighlightItem(
      title: 'Beca Talento',
      description: 'Hasta 50% por excelencia academica.',
      icon: Icons.star_outline,
      color: AppColors.gold,
    ),
    HighlightItem(
      title: 'Beca Innovacion',
      description: 'Apoyo para proyectos con impacto social.',
      icon: Icons.emoji_objects_outlined,
      color: AppColors.sky,
    ),
    HighlightItem(
      title: 'Beca Liderazgo',
      description: 'Beneficios para lideres estudiantiles y deportistas.',
      icon: Icons.diversity_1_outlined,
      color: AppColors.teal,
    ),
  ];

  static const List<FaqItem> faqs = [
    FaqItem(
      question: 'Cuantas convocatorias existen al anio?',
      answer: 'Contamos con dos convocatorias principales y un ingreso continuo para programas online.',
    ),
    FaqItem(
      question: 'Se puede homologar estudios previos?',
      answer: 'Si, evaluamos cada caso y ofrecemos rutas de homologacion flexibles.',
    ),
    FaqItem(
      question: 'Que modalidades de pago estan disponibles?',
      answer: 'Pagos mensuales, semestrales y convenios con instituciones financieras.',
    ),
    FaqItem(
      question: 'Puedo cambiar de programa durante el primer anio?',
      answer: 'Nuestro modelo permite cambios con acompanamiento academico y validacion de materias.',
    ),
  ];

  static const List<ResearchLabItem> labs = [
    ResearchLabItem(
      name: 'Laboratorio de IA aplicada',
      focus: 'Modelos predictivos y asistentes inteligentes.',
      lead: 'Dra. Elena Silva',
    ),
    ResearchLabItem(
      name: 'Centro de Sustentabilidad',
      focus: 'Energia limpia, agua y ciudades resilientes.',
      lead: 'Ing. Carlos Jara',
    ),
    ResearchLabItem(
      name: 'Hub de Experiencia Digital',
      focus: 'UX research, accesibilidad y diseno de servicios.',
      lead: 'Mg. Andrea Paredes',
    ),
  ];

  static const List<ServiceItem> researchProjects = [
    ServiceItem(
      title: 'Proyecto Horizon',
      description: 'Plataforma de analitica para prevenir la desercion estudiantil.',
      icon: Icons.insights_outlined,
      action: 'Ver reporte',
      color: AppColors.sky,
    ),
    ServiceItem(
      title: 'Energias circulares',
      description: 'Modelos de aprovechamiento energetico en campus.',
      icon: Icons.eco_outlined,
      action: 'Descargar resumen',
      color: AppColors.teal,
    ),
    ServiceItem(
      title: 'Estudio de empleabilidad 2025',
      description: 'Tendencias regionales y competencias clave.',
      icon: Icons.analytics_outlined,
      action: 'Explorar',
      color: AppColors.gold,
    ),
  ];

  static const List<NewsItem> publications = [
    NewsItem(
      title: 'Revista Innovacion & Sociedad Vol. 8',
      summary: 'Articulos sobre educacion y transformacion digital.',
      date: 'Feb 2025',
      tag: 'Publicacion',
    ),
    NewsItem(
      title: 'Manual de buenas practicas en laboratorios',
      summary: 'Protocolos de seguridad y aprendizaje activo.',
      date: 'Dic 2024',
      tag: 'Guia',
    ),
    NewsItem(
      title: 'Informe de sostenibilidad',
      summary: 'Resultados y metas ambientales institucionales.',
      date: 'Nov 2024',
      tag: 'Reporte',
    ),
  ];

  static const List<ClubItem> clubs = [
    ClubItem(
      name: 'Club de Innovadores',
      description: 'Retos de emprendimiento y prototipado rapido.',
      icon: Icons.rocket_launch_outlined,
    ),
    ClubItem(
      name: 'Comunidad Creativa',
      description: 'Talleres de diseno, fotografia y multimedia.',
      icon: Icons.brush_outlined,
    ),
    ClubItem(
      name: 'Liga Deportiva',
      description: 'Equipos y torneos interuniversitarios.',
      icon: Icons.sports_soccer_outlined,
    ),
    ClubItem(
      name: 'Voluntariado Social',
      description: 'Proyectos con impacto en comunidades locales.',
      icon: Icons.volunteer_activism_outlined,
    ),
  ];

  static const List<FacilityItem> facilities = [
    FacilityItem(
      name: 'Residencias universitarias',
      detail: 'Habitaciones equipadas, seguridad 24/7 y coworking.',
      icon: Icons.apartment_outlined,
    ),
    FacilityItem(
      name: 'Centro deportivo',
      detail: 'Gimnasio, piscina semiolimpica y canchas multiples.',
      icon: Icons.fitness_center_outlined,
    ),
    FacilityItem(
      name: 'Centro cultural',
      detail: 'Auditorio, salas de musica y estudio creativo.',
      icon: Icons.theater_comedy_outlined,
    ),
  ];

  static const List<ServiceItem> digitalServices = [
    ServiceItem(
      title: 'Tramites en linea',
      description: 'Certificados, solicitudes y legalizaciones digitales.',
      icon: Icons.assignment_outlined,
      action: 'Iniciar tramite',
      color: AppColors.sky,
    ),
    ServiceItem(
      title: 'Pagos y facturacion',
      description: 'Consulta de saldos, cuotas y planes de pago.',
      icon: Icons.payments_outlined,
      action: 'Ver estado',
      color: AppColors.teal,
    ),
    ServiceItem(
      title: 'Biblioteca digital',
      description: 'Bases de datos, libros y revistas especializadas.',
      icon: Icons.menu_book_outlined,
      action: 'Explorar',
      color: AppColors.gold,
    ),
    ServiceItem(
      title: 'Aula virtual',
      description: 'Recursos, clases grabadas y seguimiento academico.',
      icon: Icons.cast_for_education_outlined,
      action: 'Entrar',
      color: AppColors.navy,
    ),
  ];

  static const List<ServiceItem> campusServices = [
    ServiceItem(
      title: 'Bienestar estudiantil',
      description: 'Psicologia, consejeria y apoyo integral.',
      icon: Icons.health_and_safety_outlined,
      action: 'Agendar cita',
      color: AppColors.teal,
    ),
    ServiceItem(
      title: 'Bolsa de empleo',
      description: 'Vacantes, mentorias y practicas profesionales.',
      icon: Icons.work_outline,
      action: 'Ver vacantes',
      color: AppColors.sky,
    ),
    ServiceItem(
      title: 'Centro de idiomas',
      description: 'Cursos intensivos y certificaciones internacionales.',
      icon: Icons.language_outlined,
      action: 'Inscribirse',
      color: AppColors.gold,
    ),
    ServiceItem(
      title: 'Soporte tecnologico',
      description: 'Mesa de ayuda para plataformas y equipos.',
      icon: Icons.support_outlined,
      action: 'Reportar',
      color: AppColors.navy,
    ),
  ];

  static const List<String> procedures = [
    'Certificado de notas',
    'Actualizacion de datos',
    'Solicitudes de practicas',
    'Duplicado de credencial',
    'Solicitud de becas',
  ];

  static const List<ContactItem> contactItems = [
    ContactItem(
      label: 'Telefono',
      value: '+593 2 123 4567',
      icon: Icons.phone_outlined,
    ),
    ContactItem(
      label: 'WhatsApp',
      value: '+593 99 888 7777',
      icon: Icons.chat_outlined,
    ),
    ContactItem(
      label: 'Correo',
      value: 'admisiones@mitcpanta.edu',
      icon: Icons.alternate_email_outlined,
    ),
    ContactItem(
      label: 'Direccion',
      value: 'Campus Norte, Calle Principal #100',
      icon: Icons.location_on_outlined,
    ),
  ];

  static const List<EventItem> visitSlots = [
    EventItem(
      title: 'Tour guiado presencial',
      date: 'Martes y jueves',
      location: 'Campus Norte',
      category: '10:00 - 12:00',
    ),
    EventItem(
      title: 'Sesion informativa virtual',
      date: 'Sabados',
      location: 'Zoom Live',
      category: '09:00 - 10:30',
    ),
    EventItem(
      title: 'Clase muestra',
      date: 'Viernes',
      location: 'Aula XR',
      category: '16:00 - 18:00',
    ),
  ];
}
