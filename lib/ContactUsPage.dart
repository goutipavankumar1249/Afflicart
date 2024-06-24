import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'CardWithGradient.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contact us',
                style: GoogleFonts.poppins(
                  color: Colors.green[700],
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 45), 
            ],
          ),
          titleSpacing: 0,
          toolbarHeight: 55,
        ),
      backgroundColor: const Color.fromRGBO(170, 206, 144, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/ContactUs.png', width: 100, height: 150), // Ensure this asset exists
              SizedBox(height: 16),
              Text(
                'You can get in touch with us through below platforms. Our Team will reach out to you as soon as it would be possible.',
                style: GoogleFonts.poppins(
                  color: Colors.green.shade800,
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              CardWithGradient(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Customer Support',
                        style: GoogleFonts.poppins(
                          color: Colors.green.shade800,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(203, 222, 175, 1),
                        child:Icon(Icons.phone_outlined,color: Colors.lightGreen,),
                      ),
                      title: Text('Contact Number',
                          style: GoogleFonts.poppins()
                      ),
                      subtitle: Text('+91 8899776655'),
                      onTap: () {
                        _launchURL('tel:+918899776655');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(203, 222, 175, 1),
                        child:Icon(Icons.email_outlined,color: Colors.lightGreen,),
                      ),
                      title: Text('Email Address',
                          style: GoogleFonts.poppins()
                      ),
                      subtitle: Text('help@afflicartz.com',
                          style: GoogleFonts.poppins()
                      ),
                      onTap: () {
                        _launchURL('mailto:help@afflicartz.com');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              CardWithGradient(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Social Media',
                        style: GoogleFonts.poppins(
                          color: Colors.green.shade800,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assets/images/insta.png'),
                      ),
                      title: Text('Instagram',style: GoogleFonts.poppins()),
                      subtitle: Text('@afflicartz_',style: GoogleFonts.poppins()),
                      onTap: () {
                        _launchURL('https://www.instagram.com/afflicartz_');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset('assets/images/youtube.png'),
                      ),
                      title: Text('Youtube',style: GoogleFonts.poppins()),
                      subtitle: Text('@afflicartz_ecom',style: GoogleFonts.poppins()),
                      onTap: () {
                        _launchURL('https://www.youtube.com/afflicartz_ecommerce');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset('assets/images/twitter.png'),
                      ),
                      title: Text('Twitter',style: GoogleFonts.poppins()),
                      subtitle: Text('@afflicartz_ecom',style: GoogleFonts.poppins()),
                      onTap: () {
                        _launchURL('https://www.twitter.com/afflicartz_ecom');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset('assets/images/whatapp.png'),
                      ),
                      title: Text('WhatsApp',style: GoogleFonts.poppins()),
                      subtitle: Text('@afflicartz_ecom',style: GoogleFonts.poppins()),
                      onTap: () {
                        _launchURL('https://www.whatsapp.com');
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset('assets/images/telegram.png'),
                      ),
                      title: Text('Telegram',style: GoogleFonts.poppins()),
                      subtitle: Text('@afflicartz_ecom',style: GoogleFonts.poppins()),
                      onTap: () {
                        _launchURL('https://www.telegram.com');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}