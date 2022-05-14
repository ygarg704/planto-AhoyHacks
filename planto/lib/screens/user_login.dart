// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:planto/animations/bottomAnimation.dart';
import 'package:planto/screens/home.dart';
import 'package:planto/screens/merchant_login.dart';
import 'package:planto/widgets/backBtnAndImage.dart';

class UserLogin extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<User> _signIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    UserCredential authResult =
        await _firebaseAuth.signInWithCredential(credential);
    final User userDetails = authResult.user;

    ProviderMerchantDetails providerInfo =
        new ProviderMerchantDetails(userDetails.uid);

    List<ProviderMerchantDetails> providerData =
        new List<ProviderMerchantDetails>();
    providerData.add(providerInfo);

    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => Home()),
    );

    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackBtn(),
            ImageAvatar(
              assetImage: 'assets/customer.png',
            ),
            Container(
              width: width,
              height: height,
              margin: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.1, width * 0.05, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: GoogleFonts.abel(
                        fontSize: height * 0.045, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'Features',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1. Details about different Diseases/Plants'
                    '\n2. Shop for different Plants'
                    '\n3. Have 24/7 Support'
                    '\n4. Fast and Easy Payment'
                    '\n5. Search for Nearest Stores'
                    '\n6. Feedback/Complaints',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        height: height * 0.002),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    color: Colors.white,
                    shape: StadiumBorder(),
                    onPressed: () {
                      _signIn(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        WidgetAnimator(
                          Image(
                            image: AssetImage('assets/google.png'),
                            height: height * 0.038,
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          'Login Using Gmail',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.021),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: height * 0.15),
                width: width,
                height: height * 0.08,
                child: WidgetAnimator(
                  Text(
                    '"The best time to plant a tree was 20 years ago \nThe next best time is now.'
                    '\nTake care of your plants!"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height * 0.017,
                        color: Colors.black.withOpacity(0.3),
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderMerchantDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderUserDetails {
  ProviderUserDetails(this.providerDetails);

  final String providerDetails;
}
