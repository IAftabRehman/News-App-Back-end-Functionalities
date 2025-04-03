import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Models/areaModel.dart';
import 'package:news_app_backend_functionalities/Models/categoriesModel.dart';
import 'package:news_app_backend_functionalities/Services/areaServices.dart';
import 'package:news_app_backend_functionalities/Services/categoriesServices.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/educationScreen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/politicsScreen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/sportsScreen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/technologyScreen.dart';
import 'package:news_app_backend_functionalities/Views/newsScreens/worldnewsScreen.dart';

class categories_screen extends StatefulWidget {
  const categories_screen({super.key});

  @override
  State<categories_screen> createState() => _categories_screenState();
}

class _categories_screenState extends State<categories_screen> {
  List<String> items = [
    'Education',
    'Politics',
    'Sports',
    'Technology',
    'World News',
  ];
  String? selectedItem;

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_news.jpg"),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Explore News by Category",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 250),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: Colors.black12,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      iconSize: 40,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      hint: Text(
                        "Select an Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // Default hint when no item is selected
                      value: selectedItem,
                      // Selected item
                      items:
                          items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),

                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                      onPressed: () async {
                        if (selectedItem == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please select a category")),
                          );
                          return;
                        }

                        String? currentId =
                            FirebaseAuth.instance.currentUser?.uid;
                        if (currentId == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("User is not Logged In")),
                          );
                          return;
                        }
                        try {
                          isLoading = true;
                          setState(() {});
                          if (selectedItem.toString() == "Politics") {
                            tryCatch(context, selectedItem.toString(), currentId).then((val) {
                              isLoading = false;
                              setState(() {});
                            });
                          }else if(selectedItem.toString() == "Education"){
                            tryCatch(context, selectedItem.toString(), currentId).then((val){
                              isLoading = false;
                              setState(() {});
                            });
                          }else if(selectedItem.toString() == "Technology"){
                            tryCatch(context, selectedItem.toString(), currentId).then((val) {
                              isLoading = false;
                              setState(() {});
                            });
                          }else if(selectedItem.toString() == "Sports"){
                            tryCatch(context, selectedItem.toString(), currentId).then((val) {
                              isLoading = false;
                              setState(() {});
                            });
                          }else if(selectedItem.toString() == "World News"){
                            tryCatch(context, selectedItem.toString(), currentId).then((val) {
                              isLoading = false;
                              setState(() {});
                            });
                          }
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
                        elevation: 10,
                        shadowColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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

// Calling my extra news files
void navigateToScreen(BuildContext context, String screenName) {
  Map<String, Widget> routes = {
    "Technology": technology_Screen(),
    "Education": educationScreen(),
    "Politics": politicsScreen(),
    "Sports": sportScreen(),
    "World News": worldnewsScreen(),
  };
  if (routes.containsKey(screenName)) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => routes[screenName]!),
    );
  } else {
    Text("Categories would be Selected");
  }
}


Future<void> tryCatch(BuildContext context, String selectedItem, String currentId) async {
  await CategoriesServices()
      .createCategories(
        CategoriesModel(
          categoriesName: selectedItem.toString(),
          docId: currentId.toString(),
          extraId: selectedItem.toString(),
          createdAt: DateTime.now().millisecondsSinceEpoch,
        ),
      )
      .then((val) {
        navigateToScreen(context, selectedItem);
      });
}
