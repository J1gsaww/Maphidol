import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:maphidol/screen/home.dart';
import 'package:maphidol/screen/register_page.dart';
import 'package:maphidol/model/Profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Profile profile = Profile();
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
                      image: AssetImage('images/regis.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 150,
                            color: Color.fromARGB(255, 216, 65, 52),
                          ),
                          SizedBox(height: 50),
                          // Hello again
                          Text(
                            'Hi, Welcome TO ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'HelloSpring',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Maphidol',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'HelloSpring',
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 50),
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
                          SizedBox(height: 20),
                          // sign in and cancel buttons
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 90.0, vertical: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      try {
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email: profile.email ?? "",
                                                password:
                                                    profile.passwrd ?? "");
                                        formKey.currentState!.reset();
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                      } on FirebaseAuthException catch (e) {
                                        Fluttertoast.showToast(
                                            msg: e.message ?? "",
                                            gravity: ToastGravity.CENTER);
                                      }
                                    }
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage(),
                                      ),
                                    );
                                  },
                                  padding: EdgeInsets.all(25),
                                  color: Color.fromARGB(255, 52, 129, 201),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage(),
                                      ),
                                    );
                                  },
                                  padding: EdgeInsets.all(25),
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
// Do not have an account? Sign up
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Do not have an account?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          RegisterPage(),
                                    ),
                                  );
// Add your sign up logic here
                                },
                                child: Text(
                                  ' Sign Up',
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
