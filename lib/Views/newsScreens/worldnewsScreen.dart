import 'package:flutter/material.dart';
import 'commentScreen.dart';

class worldnewsScreen extends StatefulWidget {
  const worldnewsScreen({super.key});

  @override
  State<worldnewsScreen> createState() => _worldnewsScreenState();
}

class _worldnewsScreenState extends State<worldnewsScreen> {
  bool _showFullNews = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(
          "World News Screen",
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
                "assets/images/worldNews.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "World News",
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
                      "Humanitarian Crises",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "Myanmar Earthquake: A devastating 7.7 magnitude earthquake struck Myanmar, resulting in over 1,000 fatalities and widespread destruction...",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "International Relations",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "South Sudan Tensions: UN Secretary-General António Guterres has urged global leaders to unite in preventing a new civil war in South Sudan...",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Media and Information",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "Radio Free Europe's Funding Cut: The Trump administration's decision to reduce funding for Radio Free Europe has raised concerns...",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Sports",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text(
                      "Figure Skating Triumph: Alysa Liu, 19, became the first American woman in 19 years to win the World Figure Skating Championships...",
                      style: TextStyle(fontSize: 14),
                    ),

                    SizedBox(height: 30),
                    comments_screen(categoriesName: 'World News'),
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
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}



