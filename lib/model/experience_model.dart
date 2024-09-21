class Experience {
  final String name;
  final String role;
  final String date;
  final String description;
  final String link;

  Experience({
    required this.name,
    required this.role,
    required this.date,
    required this.description,
    required this.link,
  });
}

List<Experience> experienceList = [
  Experience(
    name: 'Schachner Private Limited',
    role: "Backend Intern",
    date: "APRIL-JUNE 2024",
    description:
        'Demonstrated exceptional technical skills in backend development, significantly enhancing system efficiency '
        'and reliability ',
    link:
        'https://drive.google.com/drive/u/1/folders/14bEgCnuemdW9kfBwRkyDeqeUAKa4mAWQ',
  ),
  Experience(
    name: 'Codescripe',
    role: "Backend Intern",
    date: "MAY -JULY 2024",
    description:
        'Focused on backend development tasks: designing and implementing APIs, optimizing database queries, and '
        'collaborating with frontend developers ',
    link:
        'https://drive.google.com/drive/u/1/folders/16tN4HSHHFdvb-UFMrzRjCF-nHJymlOrn',
  ),
];
