import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(context), // Animated background
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Photo with Animation
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TweenAnimationBuilder(
                    duration: Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    builder: (context, double value, child) {
                      return SizedBox(
                        width: 200 * value, // Adjust width as needed
                        height: 200 * value, // Adjust height as needed
                        child: Transform.scale(
                          scale: value,
                          child: child!,
                        ),
                      );
                    },
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/profile_photo.jpg', // Replace with your profile photo asset
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // Developer Description
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "N Chakridhar",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10), // Adding space between name and about me
                      Text(
                        'Empowering Success Through Innovation and Collaboration | Driving Growth and Transforming Industries.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                // Social Media Links
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialMediaButton(
                          label: 'GitHub',
                          onPressed: () => _onGitHubPressed(context),
                        ),
                        SizedBox(width: 20),
                        _buildSocialMediaButton(
                          label: 'Website',
                          onPressed: () => _onWebsitePressed(context),
                        ),
                        SizedBox(width: 20),
                        _buildSocialMediaButton(
                          label: 'Instagram',
                          onPressed: () => _onInstagramPressed(context),
                        ),
                        SizedBox(width: 20),
                        _buildSocialMediaButton(
                          label: 'LinkedIn',
                          onPressed: () => _onLinkedInPressed(context),
                        ),
                       
                        // Add more social media buttons here
                      ],
                    ),
                  ),
                ),
                // Description
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'More About Me',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10), // Adding space between title and description
                      Text(
                        ' I am an eager and highly driven student with a focus on machine learning and artificial intelligence (AI). I am committed to investigating the tremendous potential of AI/ML to transform industries and enhance peoples lives because of my unquenchable curiosity for cutting-edge technologies.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                // Photo Gallery
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Photo Gallery',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10), // Adding space between title and gallery
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildPhoto(imageUrl: 'https://media.licdn.com/dms/image/D5622AQGjGoHeDrCDzw/feedshare-shrink_2048_1536/0/1690467597096?e=1717027200&v=beta&t=DsqAKYLIEl0-s9m_0lR82BY8wwICth7pxaGJXJvnoOo'),
                            _buildPhoto(imageUrl: 'https://media.licdn.com/dms/image/D5622AQEiFp28yL_ArA/feedshare-shrink_2048_1536/0/1690305702653?e=1717027200&v=beta&t=wxddH3vSxEwbKzorMpHkLQa1bdXJME5PVNsjcEKE96E'),
                            _buildPhoto(imageUrl: 'https://media.licdn.com/dms/image/D5622AQH3TDBAgMstLg/feedshare-shrink_2048_1536/0/1711562122629?e=1717027200&v=beta&t=8xuA6zmSSZgYxvoSCTXysQT7gwi4mc3XUK0a66tV3A0'),
                            _buildPhoto(imageUrl: 'https://media.licdn.com/dms/image/D5622AQHrjrQNPdzIHw/feedshare-shrink_2048_1536/0/1690261272670?e=1717027200&v=beta&t=Vw9ijOQdnyuLVb5G1xDNIlha4DR0VaPS5IDXopTBQsY'),
                            // Add more demo images here
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Additional Content
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Additional Content',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10), // Adding space between title and content
                      Text(
                        'I am constantly looking for possibilities to further my education as a sophomore in the B.Tech. Computer Science program and a backend developer with a passion for app development.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButton({required String label, required VoidCallback onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF833ab4), Color(0xFFfd1d1d), Color(0xFFfcb045), Color(0xFFffa600)],
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            children: [
              Icon(Icons.person, color: Colors.white), // Change the icon based on label
              SizedBox(width: 5),
              Text(label, style: TextStyle(fontSize: 14, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Container(
      color: Colors.black, // Black background
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }

  // Define other methods here
  Widget _buildPhoto({required String imageUrl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageUrl,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _onGitHubPressed(BuildContext context) {
    const url = 'https://github.com/Chakridhar2555'; // Replace with your GitHub profile URL
    _launchURL(url);
  }

  void _onWebsitePressed(BuildContext context) {
   const url = 'https://chakridhar.teamapartx.com/'; // Replace with your GitHub profile URL
    _launchURL(url);
  }

  void _onInstagramPressed(BuildContext context) {
    const url = 'https://www.instagram.com/chakrinaidu___/'; // Replace with your GitHub profile URL
    _launchURL(url);
  }

  void _onLinkedInPressed(BuildContext context) {
    const url = 'https://www.linkedin.com/in/n-chakridhar-624792232/'; // Replace with your GitHub profile URL
    _launchURL(url);
  }



  // Function to launch URLs
  void _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
