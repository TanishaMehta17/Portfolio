class CertificateModel {
  final String name;
  final String organization;
  final String date;
  final String skills;
  final String credential;

  CertificateModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.skills,
    required this.credential,
  });
}

List<CertificateModel> certificateList = [
  CertificateModel(
    name: 'Master Sorting Techniques in DSA',
    organization: 'Coding Ninja',
    date: 'JAN 2023',
    skills: 'Bubble . Selection . Quick. Merge . Heap Sort',
    credential:
        'https://drive.google.com/file/d/11buQ6XT_brjYR1jzTnn-URbTR03JnVT_/view',
  ),
  CertificateModel(
    name: 'Introduction to AIML',
    organization: 'Great Learnings',
    date: 'DEC 2022',
    skills: 'Fundamentals of AIML . Types of ML',
    credential:
        'https://drive.google.com/file/d/11XMF3gw9fB59FhF_ggX75Gb93RX2FYd2/view',
  ),
  CertificateModel(
    name: 'Introduction to Python',
    organization: 'Simplilearn',
    date: 'MAR 2023',
    skills: 'Basics . Numpy . Pandas . Seaborn',
    credential:
        'https://drive.google.com/file/d/11ZM5bn2rPU9QVyFj8dV2OBJnY7L_UQfY/view',
  ),
];
