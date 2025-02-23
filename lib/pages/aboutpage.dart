import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_signs/Components/styledText.dart';
import 'package:little_signs/colors/appColors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (url.startsWith('mailto:')) {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'youremail@example.com',
        queryParameters: {
          'subject': 'Inquiry about the App',
          'body': 'Hello, I would like to know more about your application.',
        },
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw 'Could not launch $emailUri';
      }
    } else {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  StyledText(
                      text: "Little Signs",
                      borderColor: Colors.white,
                      primaryColor: textPurple,
                      fsize: 40),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15, top: 10),
              child: const Icon(
                Icons.help_outline,
                color: Colors.white,
                size: 90,
              ),
            ),
          ],
        ),
        toolbarHeight: 140,
        backgroundColor: textPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'About the Application',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      textAlign: TextAlign.justify,
                      'Our application "LITTLE SIGNS" is meant for the purpose of spreading education to specially abled students who can’t speak or listen. The app is fully equipped with lessons that help students learn Indian Sign Language. It includes nearly 300 most commonly used words, 30-40 sentences, and around 20 tests.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Dataset Credits
              const Center(
                child: Text(
                  'Dataset Credits',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10)),
                    elevation: const WidgetStatePropertyAll(5),
                    backgroundColor: WidgetStatePropertyAll(textPurple),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  onPressed: () => _launchURL(
                      'https://www.data.gov.in/resource/indian-sign-language-dictionary-till-january-2024'),
                  child: const Text(
                    'View Dataset',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                textAlign: TextAlign.justify,
                'The dataset is completely owned by the respective owner. I do not own any part of the dataset used in this application.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Text(
                'Dataset Policy:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                textAlign: TextAlign.justify,
                'Following the mandate of the National Data Sharing and Accessibility Policy (NDSAP) of the Government of India, all users are provided a worldwide, royalty-free, non-exclusive license to use, adapt, publish, translate, and create derivative works for lawful commercial and non-commercial purposes.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              // Social Media Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(FontAwesomeIcons.github,
                      'https://github.com/saksham-09-design'),
                  const SizedBox(width: 15),
                  _buildSocialButton(FontAwesomeIcons.globe,
                      'https://saksham-09-design.github.io/Saksham_Portfolio/'),
                  const SizedBox(width: 15),
                  _buildSocialButton(FontAwesomeIcons.instagram,
                      'https://www.instagram.com/saksham_loona/'),
                  const SizedBox(width: 15),
                  _buildSocialButton(FontAwesomeIcons.linkedin,
                      'https://www.linkedin.com/in/saksham-loona-716248291/'),
                  const SizedBox(width: 15),
                  _buildSocialButton(
                      Icons.mail, 'mailto:sakshamloona9@gmail.com'),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: textPurple,
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
