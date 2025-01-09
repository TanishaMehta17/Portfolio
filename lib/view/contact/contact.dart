import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ContactController extends GetxController {
  ScrollController scrollController = ScrollController();
}

class ContactForm extends StatefulWidget {
   final controller = Get.put(ContactController());
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  final contactController = Get.put(ContactController());

  // Function to send the email
  _sendEmail() async {
    final subject = Uri.encodeFull(_subjectController.text);
    final body = Uri.encodeFull(
        "From: ${_emailController.text}\n\nMessage:\n${_messageController.text}");

    final emailUri =
        'mailto:tanishamehtra1709@gmail.com?subject=$subject&body=$body';

    if (await canLaunch(emailUri)) {
      await launch(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  // Function to launch social media URLs
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Helper to determine responsive font size
  double getResponsiveFontSize(
      BuildContext context, double desktopSize, double mobileSize) {
    if (MediaQuery.of(context).size.width < 600) {
      return mobileSize; // Mobile size
    } else {
      return desktopSize; // Desktop size
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             
              SizedBox(height: 20),

              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: [Colors.pink, Colors.blue.shade900],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: TypewriterText(
                  text: 'I am just a Click Away!',
                  duration: Duration(milliseconds: 150),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: getResponsiveFontSize(
                            context, 60, 30), // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
              SizedBox(height: 20),

              // Description with responsive font size
              Container(
                width: 450,
                child: Text(
                  "Feel free to reach out and let's turn ideas into reality. "
                  "Whether you have a project in mind, want to discuss collaboration opportunities, "
                  "or just fancy a good conversation, my inbox is always open. "
                  "Let's connect and explore the possibilities together. "
                  "Your message is the next chapter in this creative journey, and I'm excited to be a part of it.",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: getResponsiveFontSize(
                            context, 18, 14), // Responsive font size
                        color: Colors.white.withOpacity(0.7),
                      ),
                ),
              ),
              SizedBox(height: 30),

              // Contact Form
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // Name Field
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Your Name*',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[800],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Email Field
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Your E-mail Address*',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[800],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Subject Field
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                      child: TextFormField(
                        controller: _subjectController,
                        decoration: InputDecoration(
                          labelText: 'Subject',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[800],
                        ),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Message Field
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                      child: TextFormField(
                        controller: _messageController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Type your message here...',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[800],
                        ),
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Submit Button with Gradient
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.5, // 50% of screen width
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.pink, Colors.blue.shade900],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _sendEmail();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sending Email...')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'SEND!',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Social Media Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset(
                      'assets/images/linkldn.jpeg',
                      width: 40,
                      height: 40,
                    ),
                    onPressed: () {
                      _launchURL(
                          'https://www.linkedin.com/in/tanisha-mehta-a0a89a256/');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/github1.png',
                        width: 40, height: 40),
                    onPressed: () {
                      _launchURL('https://github.com/TanishaMehta17');
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/leetcode-icon.png',
                        width: 50, height: 50),
                    onPressed: () {
                      _launchURL('https://leetcode.com/u/Tanisha_Mehta/');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final Duration duration;
  final TextStyle style;

  const TypewriterText({
    required this.text,
    this.duration = const Duration(milliseconds: 100),
    this.style = const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  });

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayedText = '';
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _displayedText = widget.text.substring(0, _currentIndex);
        _currentIndex++;
      });
      if (_currentIndex > widget.text.length) {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style,
    );
  }
}
