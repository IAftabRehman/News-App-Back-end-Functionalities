import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/comments.dart';

class politicsScreen extends StatefulWidget {
  const politicsScreen({super.key});

  @override
  State<politicsScreen> createState() => _politicsScreenState();
}

class _politicsScreenState extends State<politicsScreen> {
  bool _showFullNews = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          "Politics News",
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
                "assets/images/politics.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Politics News",
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
                      "Economic Developments",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "On March 25, 2025, Pakistan secured a staff-level agreement with the International Monetary Fund (IMF) to unlock 1.3 billion under a new 28-month climate resilience loan program. This agreement also encompasses the first review of the ongoing 37-month bailout program. Upon approval by the IMF board, Pakistan is set to receive a total of 2 billion in disbursements, reflecting significant progress in stabilizing its economy.",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Security Concerns",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "The insurgency in Balochistan has intensified, with militant groups like the Baloch Liberation Army (BLA) executing more sophisticated and deadly attacks. Grievances over resource exploitation and political disenfranchisement have fueled this resurgence. The return of the Taliban in Afghanistan has further emboldened these groups, posing a significant security challenge for Pakistan.",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Political Landscape",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "The political environment remains tense following the November 2024 protests led by the Pakistan Tehreek-e-Insaf (PTI) party, demanding the release of former Prime Minister Imran Khan. These demonstrations resulted in clashes with security forces and heightened political polarization",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    SizedBox(height: 30),
                    comments_screen(),

                    SizedBox(height: 30),
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
