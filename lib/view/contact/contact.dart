import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async'; // For the typewriter animation

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

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

  // Function to launch URL for social media links
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Typewriter text effect with gradient
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
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color:
                          Colors.white, // This will be overridden by ShaderMask
                    ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 450,
              child: Text(
                "Feel free to reach out and let's turn ideas into reality. Whether you have a project in mind, "
                "want to discuss collaboration opportunities, or just fancy a good conversation, my inbox is always open. "
                "Let's connect and explore the possibilities together. Your message is the next chapter in this creative journey, "
                "and I'm excited to be a part of it.",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.7),
                    ),
              ),
            ),
            SizedBox(height: 30),

            // Contact Form
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    // Name Field
                    TextFormField(
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
                    SizedBox(height: 10),

                    // Email Field
                    TextFormField(
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
                    SizedBox(height: 10),

                    // Subject Field
                    TextFormField(
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
                    SizedBox(height: 10),

                    // Message Field
                    TextFormField(
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
                    SizedBox(height: 20),

                    // Submit Button with Gradient and White Text
                    Container(
                      height: 60,
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
                          backgroundColor: Colors
                              .transparent, // No color needed since we use gradient
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'SEND!',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins', // Updated font
                            color: Colors.white, // White text
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                    _launchURL(
                      'https://github.com/TanishaMehta17',
                    );
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
    );
  }
}

// TypewriterText widget for the animation
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
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_currentIndex];
          _currentIndex++;
        });
      } else {
        timer.cancel();
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

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: ContactForm(),
    ),
  ));
}
