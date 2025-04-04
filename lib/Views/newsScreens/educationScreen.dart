import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'commentScreen.dart';

class educationScreen extends StatefulWidget {
  const educationScreen({super.key});

  @override
  State<educationScreen> createState() => _educationScreenState();
}

class _educationScreenState extends State<educationScreen> {
  bool _showFullNews = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          "Education News",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 10,
        shadowColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/education.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Education News",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              _showFullNews ? SizedBox():
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showFullNews = !_showFullNews; // Toggle visibility
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Show Full News",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              if (_showFullNews)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Starlinks Entry into Pakistan",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "Elon Musk's Starlink has received a no-objection certificate to commence services in Pakistan, aiming to enhance internet connectivity, particularly in remote regions.",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Aerospace Technology",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "The National Aerospace Science and Technology Park, inaugurated in August 2023, continues to bolster Pakistan's aerospace industry by fostering research and innovation in aviation, space, IT, and cyber sectors. \n In November 2024, Pakistan unveiled the Shahpar-III, a medium-altitude long-endurance unmanned combat aerial vehicle designed to compete with global counterparts like the MQ Reaper",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Cybersecurity Initiatives",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "The establishment of the Pakistan Computer Emergency Response Team (PKCERT) in March 2024 marked a significant step towards strengthening national cybersecurity and countering emerging cyber threats",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Blockchain and Cryptocurrency Regulation",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "In March 2025, the government launched the Pakistan Crypto Council (PCC) to oversee and promote blockchain technology and digital assets, signaling a progressive approach to integrating these technologies into the financial landscape. ",
                      style: TextStyle(fontSize: 14),
                    ),

                    SizedBox(height: 30),
                    comments_screen(categoriesName: 'Education'),
                    SizedBox(height: 30,),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showFullNews = !_showFullNews; // Toggle visibility
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          _showFullNews ? "Hide Details" : "Show Full News",
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
