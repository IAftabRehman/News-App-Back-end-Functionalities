import 'package:flutter/material.dart';
import 'commentScreen.dart';

class sportScreen extends StatefulWidget {
  const sportScreen({super.key});

  @override
  State<sportScreen> createState() => _sportScreenState();
}

class _sportScreenState extends State<sportScreen> {
  bool _showFullNews = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          "Sport News",
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
                "assets/images/sports.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Sports News",
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
                      "Cricket",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "In the first One Day International (ODI) against New Zealand on March 29, 2025, Pakistan faced a 73-run defeat. New Zealand's Mark Chapman scored 132 runs, contributing to a total of 344-9. Despite efforts from Pakistan's batsmen, they were unable to chase the target.\nInjuries have impacted team compositions, with New Zealand's captain Tom Latham ruled out of the ODI series due to a hand injury. ",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Olympics",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "At the 2024 Paris Olympics, javelin thrower Arshad Nadeem made history by winning Pakistan's first-ever Olympic gold medal in an individual sport. He set a new Olympic record with a throw of 92.97 meters, ending the country's 32-year Olympic medal drought",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Football",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "The 2024 National Women Football Championship concluded with Karachi City clinching the title. The tournament featured 26 teams and marked the first edition without departmental teams, promoting club-level competition. \nIn the remote region of Gilgit-Baltistan, the Girls Football League continues to empower young women through sports. Founded by sisters Karishma and Sumaira Inayat, the league provides opportunities for girls aged 14-21 to engage in football, challenging cultural norms and promoting education and independence.",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Kabaddi",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "The 2025 Kabaddi World Cup was hosted in the West Midlands, UK, from March 17 to 23. The tournament featured 16 men's teams and eight women's teams, including squads from England, Scotland, and Wales. Matches were held across Birmingham, Wolverhampton, Coventry, and Walsall.",
                      style: TextStyle(fontSize: 14),
                    ),

                    SizedBox(height: 30),
                    comments_screen(categoriesName: 'Sports'),
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
