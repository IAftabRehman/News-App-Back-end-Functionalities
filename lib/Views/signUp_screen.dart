import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Models/userModel.dart';
import 'package:news_app_backend_functionalities/Services/userServices.dart';
import '../Services/authorization.dart';

class signUp_screen extends StatefulWidget {
  const signUp_screen({super.key});

  @override
  State<signUp_screen> createState() => _signUp_screenState();
}

class _signUp_screenState extends State<signUp_screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
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

                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                      onPressed: () async {
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
                        if (passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Password can't be empty")),
                          );
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

                        try {
                          isLoading = true;
                          setState(() {});
                          await authorizationServices()
                              .registerUser(
                                email: emailController.text,
                                password: passwordController.text,
                              )
                              .then((val) async {
                                await UserServices()
                                    .createUser(
                                      UserModel(
                                        name: nameController.text,
                                        email: emailController.text,
                                        phoneNumber: phoneNumberController.text,
                                        address: addressController.text,
                                        createdAt:
                                            DateTime.now()
                                                .millisecondsSinceEpoch,
                                        docId: val!.uid.toString(),
                                      ),
                                    )
                                    .then((val){
                                      isLoading = false;
                                      setState(() {});
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Message"),
                                            content: Text(
                                              "An email with verification link has been sent to your mail box.",
                                            ),
                                          );
                                        },
                                      );
                                    });
                              });
                        } catch (e) {
                          isLoading = false;
                          setState(() {});
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
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
