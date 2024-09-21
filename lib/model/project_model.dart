class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'Chatter Box',
    'Developed a WhatsApp-inspired user interface using Flutter and Dart, enhancing cross-platform compatibility through'
        'seamless integration of REST APIs.',
    'assets/images/whatsapp1.png',
    'https://github.com/TanishaMehta17/whatsapp-clone',
  ),
  Project(
    'Prime Cart',
    'Designed and implemented an Amazon-style e-commerce app with features like product listings, shopping cart, and user'
        'authentication, using Flutter and Dart for cross-platform compatibility. Integrated REST APIs for real-time dataexchange and product updates.',
    'assets/images/amazon1.png',
    'https://github.com/TanishaMehta17/amazon_clone',
  ),
  Project(
      'Smart Contact Manager',
      'The Contact Management App is a comprehensive solution designed for users to efficiently manage their contacts. It provides an intuitive interface for adding, organizing, and retrieving contact information. The app supports user authentication, including sign-up via email, Google, and GitHub, and integrates advanced features such as search, pagination, and cloud storage for contact pictures. It also includes built-in email functionality for seamless communication.',
      'assets/images/scm1.png',
      'https://github.com/TanishaMehta17/Smart_Manager'),
  Project(
      'Fintech',
      'Developed a user-friendly banking app for South India Bank with an engaging interface, integrated a personalized chatbot for enhanced user support, and implemented robust security features, including OTP verification, for user safety.',
      'assets/images/fin2.png',
      'https://github.com/TanishaMehta17/Fintech'),
  Project(
      'Phytoscan App',
      'Deployed a CNN model in an app to identify ayurvedic and medicinal plants, integrated e-commerce functionalities for plant details and uses, and implemented a personalized chatbot to assist users.',
      'assets/images/phy2.png',
      'https://github.com/bansalmohit123/phytoscan'),
  Project(
      'College Management System',
      'Developed a college management system web app allowing both teachers and students to perform SQL operations such as updating marks, setting and modifying exam dates, and managing records. The app includes features for login, signup, and comprehensive CRUD functionalities for efficient management of academic data.',
      'assets/images/cms1.png',
      'https://github.com/TanishaMehta17/College-Management-System'),
 
];
