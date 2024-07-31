
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  late bool obscure=true;

  @override
  void initState() {
    super.initState();
    emailCheck();

  }

  late String? storedEmail;
  late String? storedPwd;
  emailCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
        storedEmail = prefs.getString("userEmail");
        storedPwd = prefs.getString("password");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
              
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
              
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      color: Colors.white,
              
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Login",style:
                        TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
              
                        ),
                        const Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.png'),
                            //backgroundColor: Colors.blue,
                            radius: 40.0,
                          ),
                        ),
                        Form(
              
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
                             child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
              
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 16.0),
                                      child: TextFormField(
                                        controller: emailController,
                                        autofocus: true,
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          labelText: "Email",
                                          prefixIcon: Icon(Icons.mail),
                                          border: OutlineInputBorder(),
              
                                        ),
                                          validator: (value)  {
                                            if(value==null || value.isEmpty){
                                              return "Please enter your email";
                                            }
                                            bool valid = RegExp(r"^[a-z0-9]+@[a-z]+\.[a-z]{2,3}").hasMatch(value);
                                            if(!valid){
                                              return "Enter valid email";
                                            }
        
                                            if(storedEmail !=null &&   storedEmail != value){
                                              return "Not a registered user";
                                            }
                                            return null;
                                          },
                                      ),
                                    ),
                                    const SizedBox(height: 15.0,),
              
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 16.0),
                                      child: TextFormField(
                                        controller: pwdController,
                                        textInputAction: TextInputAction.next,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        obscureText: obscure,
                                        decoration:  InputDecoration(
                                          labelText: "Password",
                                          prefixIcon: const Icon(Icons.lock),
                                          suffix: InkWell(
                                            onTap: (){
                                              setState(() {
                                                obscure=!obscure;
                                              });
              
                                            },
                                            child: obscure? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                                          ),
                                          border: const OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          if(value.contains(' '))return "Space not allowed";
                                          // Contains at least one uppercase letter
                                          if (!value.contains(RegExp(r'[A-Z]'))) {
                                            return 'Uppercase letter is missing\n';
                                          }

                                          // Contains at least one lowercase letter
                                          if (!value.contains(RegExp(r'[a-z]'))) {
                                            return ' Lowercase letter is missing.\n';
                                          }

                                          // Contains at least one digit
                                          if (!value.contains(RegExp(r'[0-9]'))) {
                                            return 'Digit is missing.\n';
                                          }

                                          // Contains at least one special character
                                          if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                                            return 'Special character is missing.\n';
                                          }
                                          if(value.length < 8){
                                            return "Enter strong password";
                                          }
                                          if(storedPwd !=null && storedPwd!=value){
                                            return "Enter correct password";
                                          }

                                          return null;
        
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10.0,),
                                    ElevatedButton(
                                        onPressed: ()  {
                                          if(_formKey.currentState!.validate()){
                                            saveEmail();
        
        
                                          }
                                        },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                        child: const Text("Login",
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,
                                                  color: Colors.white,
                                          ),),
                                    ),
                                    TextButton(onPressed: signInWithGoogle, child: const Text('Login in with google'))
                                  ],
              
                              ),
                            ),
              
              
                        ),
                      ],
                    ),
                  ),
              
              ),
            ),
          ),
      ),

    );
  }

  Future<void> saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userEmail", emailController.text);
    prefs.setString("password", pwdController.text);

    emailController.clear();
    pwdController.clear();

    Navigator.pushReplacementNamed(context, '/bottomNavbar');
  }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

 }

