import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Services/authorization.dart';
import 'package:news_app_backend_functionalities/Views/signUp_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Email',
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
                labelText: 'Password',
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
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Email can not be Empty")),
                      );
                      return;
                    }
                    if (passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password can not be Empty")),
                      );
                      return;
                    }

                    try {
                      isLoading = true;
                      setState(() {});
                      await authorizationServices()
                          .loginUser(
                            email: emailController.text,
                            password: passwordController.text,
                          )
                          .then((val) {
                            isLoading = false;
                            setState(() {});
                            if(true){
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Message"),
                                      content: Text("Logged In"),
                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>signUp_screen()));
                                        }, child: Text("Go to Home"))
                                      ],
                                    );
                                  });
                            }
                            else{
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Message"),
                                      content: Text("Please verify your email"),
                                    );
                                  });
                            }
                          });
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
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
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
