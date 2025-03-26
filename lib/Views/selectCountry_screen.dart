import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_backend_functionalities/Models/countryModel.dart';
import 'package:news_app_backend_functionalities/Views/login_screen.dart';
import 'package:news_app_backend_functionalities/Views/selectCity_screen.dart';

import '../Services/countryServices.dart';

class selectCountry_screen extends StatefulWidget {
  selectCountry_screen({super.key});

  @override
  State<selectCountry_screen> createState() => _selectCountry_screenState();
}

class _selectCountry_screenState extends State<selectCountry_screen> {
  String countryName = "";
  String countryCode = "";
  bool isLoading = false;

  Country? _selectedCountry;
  void _openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
          countryName = country.name;
          countryCode = country.phoneCode;
        });
      },
    );
  }


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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  countryName = _selectedCountry!.name;
                  countryCode = _selectedCountry!.phoneCode;
                },
                child: ElevatedButton(
                  onPressed: _openCountryPicker,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,
                    shadowColor: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      "Select Country",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _selectedCountry != null
                          ? Text(
                            "Country Name: ${_selectedCountry!.name} ${_selectedCountry!.flagEmoji}",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          : Text(
                            "Country Name: ??",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                      SizedBox(height: 10),

                      _selectedCountry != null
                          ? Text(
                            "Country Code: ${_selectedCountry!.phoneCode}",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          : Text(
                            "Country Code: ??",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                    onPressed: () async {
                      if (_selectedCountry == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Country must be selected")),
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
                        await CountryServices().createCountry(CountryModel(
                          docId: currentId.toString(),
                          countryName: countryName,
                          countryCode: countryCode,
                          createdAt: DateTime.now().millisecondsSinceEpoch,
                        )).then((val){
                          isLoading = false;
                          setState(() {});
                          Navigator.push(context, MaterialPageRoute(builder: (context) => selectCity_screen()));
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
                      minimumSize: Size(20, 20),
                      maximumSize: Size(150, 60),
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
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
