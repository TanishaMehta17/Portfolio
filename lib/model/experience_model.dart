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
    name: 'Nomad Devs',
    role: "Flutter Developer Intern",
    date: "SEPTEMBER -NOVEMBER 2024",
    description:
        ' • Developing Flutter Application from Figma designs, integrated business logic with Firebase as the database'
        'collaborated with cross-functional teams, and maintained clean code management using GitHub.',
    link:
        'https://drive.google.com/drive/u/0/folders/1h1eMrhrYsP3N90VtWoRC1s8ak_pDAKqI',
  ),
  Experience(
    name: 'Codescripe',
    role: "Backend Developer Intern",
    date: "MAY -JULY 2024",
    description:
        'Focused on backend development tasks: designing and implementing APIs, optimizing database queries, and '
        'collaborating with frontend developers ',
    link:
        'https://drive.google.com/drive/u/1/folders/16tN4HSHHFdvb-UFMrzRjCF-nHJymlOrn',
  ),
  Experience(
    name: 'Schachner Private Limited',
    role: "Backend Developer Intern",
    date: "APRIL-JUNE 2024",
    description:
        'Demonstrated exceptional technical skills in backend development, significantly enhancing system efficiency '
        'and reliability ',
    link:
        'https://drive.google.com/drive/u/1/folders/14bEgCnuemdW9kfBwRkyDeqeUAKa4mAWQ',
  ),
];
