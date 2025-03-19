import 'package:flutter/material.dart';

class signUp_screen extends StatefulWidget {
  const signUp_screen({super.key});

  @override
  State<signUp_screen> createState() => _signUp_screenState();
}

class _signUp_screenState extends State<signUp_screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create an Account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Enter Name',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue, // Text color
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.red,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue, // Text color
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.red,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'CreatedAt',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue, // Text color
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.red,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue, // Text color
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.red,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter Address',
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

                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Name can't be empty")),
                      );
                      return;
                    }
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Email can't be empty")),
                      );
                      return;
                    }
                    if (phoneNumberController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Phone Number can't be empty")),
                      );
                      return;
                    }
                    if (addressController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Address can't be empty")),
                      );
                      return;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,
                    shadowColor: Colors.blue,
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
