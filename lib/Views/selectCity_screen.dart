import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Models/cityModel.dart';
import 'package:news_app_backend_functionalities/Services/cityServices.dart';
import 'package:news_app_backend_functionalities/Views/login_screen.dart';
import 'package:news_app_backend_functionalities/Views/selectArea_screen.dart';

class selectCity_screen extends StatefulWidget {
  const selectCity_screen({super.key});

  @override
  State<selectCity_screen> createState() => _selectCity_screenState();
}

class _selectCity_screenState extends State<selectCity_screen> {
  TextEditingController cityName = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: cityName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue, // Text color
                fontWeight: FontWeight.bold,
              ),
              cursorColor: Colors.red,
            ),

            SizedBox(height: 20),

            isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shadowColor: Colors.blue,
                    elevation: 10,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (cityName.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("City Name Must be Selected")),
                      );
                      return;
                    }

                    String? currentId = FirebaseAuth.instance.currentUser?.uid;
                    if (currentId == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("User is not logged in.")),
                      );
                      return;
                    }

                    try {
                      isLoading = true;
                      setState(() {});
                      await CityServices()
                          .createCity(
                            CityModel(
                              cityName: cityName.text,
                              docId: currentId.toString(),
                              createdAt: DateTime.now().millisecondsSinceEpoch,
                            ),
                          )
                          .then((val) {
                            isLoading = false;
                            setState(() {});
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => selectArea_screen(),
                              ),
                            );
                          });
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
