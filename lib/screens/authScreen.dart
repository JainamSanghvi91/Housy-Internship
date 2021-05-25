import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:housytask/screens/emailAuth.dart';
import 'package:housytask/screens/googleSignIn.dart';
import 'package:housytask/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isloading = false;
  _login() {}

  @override
  Widget build(BuildContext context) {
    bool isSignIn = false;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser _user;
    FacebookLogin facebookLogin = FacebookLogin();

    Future loginWithfacebook(FacebookLoginResult result) async {
      final FacebookAccessToken gettoken = result.accessToken;
      AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: gettoken.token,
      );
      var a = await _auth.signInWithCredential(credential);
      setState(() {
        isSignIn = true;
        _user = a.user;
      });
    }

    Future<void> handleLogin() async {
      final FacebookLoginResult result = await facebookLogin.logIn(
        ['email'],
      );
      switch (result.status) {
        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
        case FacebookLoginStatus.loggedIn:
          try {
            await loginWithfacebook(result);
          } catch (e) {
            print(e);
          }
          break;
      }
    }

    Future<void> gooleSignout() async {
      await _auth.signOut().then((onValue) {
        setState(() {
          facebookLogin.logOut();
          isSignIn = false;
        });
      });
    }

    return Scaffold(
      body: isSignIn
          ? HomePage()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    bottom: 5,
                  ),
                  child: Text(
                    "Sign-up",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    bottom: 40,
                  ),
                  child: Text(
                    "Dont worry-All detials are safe to us!",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () async {
                    await handleLogin();
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Login with facebook",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      await handleLogin();
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //padding: EdgeInsets.only(top: 0.1 * maxH),
                              height: 45,
                              margin: EdgeInsets.only(right: 30, left: 30),
                              child: buildTextButton(
                                MaterialCommunityIcons.google_plus,
                                "Login with Google",
                                Color(0xFFDE4B39),
                                0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      await handleLogin();
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //padding: EdgeInsets.only(top: 0.1 * maxH),
                              height: 45,
                              margin: EdgeInsets.only(right: 30, left: 30),
                              child: buildTextButton(
                                MaterialCommunityIcons.email,
                                "Login/Register with Email",
                                Color(0xFFDE4B39),
                                1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, top: 40, right: 25),
                  child: Text(
                    "By signing up with email, google, or facebook, you agree to the Terms of Use and Privacy Policy",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor, int page) {
    return TextButton(
      onPressed: () {
        setState(() {
          _isloading = true;
        });
        if (page == 0) {
          final provider =
              Provider.of<GoogleSingnInProvider>(context, listen: false);
          provider.login();
        } else {
          Navigator.of(context).pushNamed(EmailAuth.routename);
        }

        setState(() {
          _isloading = false;
        });
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xFFDE4B39),
          ),
          SizedBox(
            width: 10,
          ),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
