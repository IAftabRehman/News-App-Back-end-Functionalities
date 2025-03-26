import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Models/areaModel.dart';
import 'package:news_app_backend_functionalities/Services/areaServices.dart';
import 'package:news_app_backend_functionalities/Views/login_screen.dart';

class selectArea_screen extends StatefulWidget {
  const selectArea_screen({super.key});

  @override
  State<selectArea_screen> createState() => _selectArea_screenState();
}

class _selectArea_screenState extends State<selectArea_screen> {
  TextEditingController areaName = TextEditingController();
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
              controller: areaName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Enter Area',
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
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                if (areaName.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Area Must be Selected")),
                  );
                  return;
                }

                String? currentId = FirebaseAuth.instance.currentUser?.uid;
                if (currentId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("User is not Logged In")));
                  return;
                }

                try {
                  isLoading = true;
                  setState(() {});
                  await AreaServices().creatArea(AreaModel(
                      areaName: areaName.text,
                      docId: currentId.toString(),
                      createdAt: DateTime
                          .now()
                          .millisecondsSinceEpoch
                  )).then((val){
                    isLoading = false;
                    setState(() {});
                    Navigator.push(context, MaterialPageRoute(builder: (context) => login_screen()));
                  });
                } catch (e) {
                  isLoading = false;
                  setState(() {});
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
