import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final IconData icon;

  const NavItem({required this.label, required this.icon});
}

class StatItem {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });
}

class HighlightItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const HighlightItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class TimelineItem {
  final String year;
  final String title;
  final String description;

  const TimelineItem({
    required this.year,
    required this.title,
    required this.description,
  });
}

class LeaderItem {
  final String name;
  final String role;
  final String focus;
  final String imageUrl;

  const LeaderItem({
    required this.name,
    required this.role,
    required this.focus,
    required this.imageUrl,
  });
}

class ProgramItem {
  final String name;
  final String faculty;
  final String level;
  final String duration;
  final String mode;
  final String accreditation;
  final List<String> tags;

  const ProgramItem({
    required this.name,
    required this.faculty,
    required this.level,
    required this.duration,
    required this.mode,
    required this.accreditation,
    required this.tags,
  });
}

class EventItem {
  final String title;
  final String date;
  final String location;
  final String category;

  const EventItem({
    required this.title,
    required this.date,
    required this.location,
    required this.category,
  });
}

class NewsItem {
  final String title;
  final String summary;
  final String date;
  final String tag;

  const NewsItem({
    required this.title,
    required this.summary,
    required this.date,
    required this.tag,
  });
}

class TestimonialItem {
  final String name;
  final String program;
  final String quote;
  final String imageUrl;

  const TestimonialItem({
    required this.name,
    required this.program,
    required this.quote,
    required this.imageUrl,
  });
}

class AdmissionStepItem {
  final String title;
  final String description;
  final String timeline;

  const AdmissionStepItem({
    required this.title,
    required this.description,
    required this.timeline,
  });
}

class FaqItem {
  final String question;
  final String answer;

  const FaqItem({required this.question, required this.answer});
}

class ServiceItem {
  final String title;
  final String description;
  final IconData icon;
  final String action;
  final Color color;

  const ServiceItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.action,
    required this.color,
  });
}

class ResearchLabItem {
  final String name;
  final String focus;
  final String lead;

  const ResearchLabItem({
    required this.name,
    required this.focus,
    required this.lead,
  });
}

class ClubItem {
  final String name;
  final String description;
  final IconData icon;

  const ClubItem({
    required this.name,
    required this.description,
    required this.icon,
  });
}

class FacilityItem {
  final String name;
  final String detail;
  final IconData icon;

  const FacilityItem({
    required this.name,
    required this.detail,
    required this.icon,
  });
}

class ContactItem {
  final String label;
  final String value;
  final IconData icon;

  const ContactItem({
    required this.label,
    required this.value,
    required this.icon,
  });
}

class StudentProfile {
  final String name;
  final String id;
  final String program;
  final String level;
  final String campus;
  final String status;
  final String advisor;
  final String email;
  final String period;
  final String modality;

  const StudentProfile({
    required this.name,
    required this.id,
    required this.program,
    required this.level,
    required this.campus,
    required this.status,
    required this.advisor,
    required this.email,
    required this.period,
    required this.modality,
  });
}

class ScheduleItem {
  final String day;
  final String time;
  final String course;
  final String room;
  final String teacher;
  final String modality;

  const ScheduleItem({
    required this.day,
    required this.time,
    required this.course,
    required this.room,
    required this.teacher,
    required this.modality,
  });
}

class CalendarItem {
  final String date;
  final String title;
  final String type;

  const CalendarItem({
    required this.date,
    required this.title,
    required this.type,
  });
}

class GradeItem {
  final String course;
  final String period;
  final String grade;
  final String status;
  final String credits;

  const GradeItem({
    required this.course,
    required this.period,
    required this.grade,
    required this.status,
    required this.credits,
  });
}

class EnrollmentItem {
  final String course;
  final String schedule;
  final String credits;
  final String seats;
  final String status;

  const EnrollmentItem({
    required this.course,
    required this.schedule,
    required this.credits,
    required this.seats,
    required this.status,
  });
}

class FinanceItem {
  final String concept;
  final String amount;
  final String dueDate;
  final String status;

  const FinanceItem({
    required this.concept,
    required this.amount,
    required this.dueDate,
    required this.status,
  });
}

class LibraryItem {
  final String title;
  final String author;
  final String dueDate;
  final String status;

  const LibraryItem({
    required this.title,
    required this.author,
    required this.dueDate,
    required this.status,
  });
}

class NotificationItem {
  final String title;
  final String message;
  final String time;
  final String category;

  const NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.category,
  });
}

class DocumentItem {
  final String name;
  final String status;
  final String updated;

  const DocumentItem({
    required this.name,
    required this.status,
    required this.updated,
  });
}

class TicketItem {
  final String title;
  final String status;
  final String updated;
  final String area;

  const TicketItem({
    required this.title,
    required this.status,
    required this.updated,
    required this.area,
  });
}
