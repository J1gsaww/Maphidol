import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:maphidol/model/Profile.dart';
import 'package:maphidol/screen/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference userinfo =
      FirebaseFirestore.instance.collection("UserAuth");
  Profile profile = Profile();
  String passcon = '';
  String temppass = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(title: Text("Error")),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Form(
                key: formKey,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/park.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.app_registration,
                            size: 150,
                            color: Color.fromARGB(255, 52, 129, 201),
                          ),

                          SizedBox(height: 10),
                          Text(
                            'Registration',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'HelloSpring',
                                fontSize: 50,
                                color: Color.fromARGB(255, 238, 238, 238)),
                          ),
                          SizedBox(height: 50),
                          // Email textfield
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 245, 186),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText:
                                          'Please fill your profile name'),
                                  keyboardType: TextInputType.name,
                                  onSaved: (String? name) {
                                    if (name != null) {
                                      profile.name = name;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Profile name',
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                          // username textfield
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 245, 186),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Please fill your email'),
                                    EmailValidator(
                                        errorText: 'Wrong format email')
                                  ]),
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (String? email) {
                                    profile.email = email!;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //password textfield
                          SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 245, 186),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  validator: RequiredValidator(
                                      errorText: 'Please fill the password'),
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: (val) => temppass = val,
                                  onSaved: (String? password) {
                                    profile.passwrd = password!;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //confirm-pasasword
                          SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 245, 186),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextFormField(
                                  validator: (val) =>
                                      MatchValidator(errorText: 'Not Match')
                                          .validateMatch(val!, temppass),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Confirm-password',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // sign in button
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 25.0),
                            child: MaterialButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: profile.email ?? "",
                                      password: profile.passwrd ?? "",
                                    )
                                        .then((value) async {
                                      await userinfo.doc(value.user!.uid).set({
                                        'Email': profile.email,
                                        'Profile name': profile.name,
                                      });
                                    }).then((value) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()),
                                      );
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    print(e.message);
                                  }
                                }
                              },
                              padding: EdgeInsets.all(25),
                              color: Color.fromARGB(255, 52, 129, 201),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
// Do not have an account? Sign up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Back to Maphidol!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Add your sign up logic here
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginPage()),
                                  );
                                },
                                child: Text(
                                  ' Sign in',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
        });
  }
}
