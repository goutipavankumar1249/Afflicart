// fire_services.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:project/UserState.dart';
import 'package:flutter/material.dart';
import 'package:project/VerifyMobile.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:libphonenumber/libphonenumber.dart';

class FireServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  Future<void> handleSignUp(BuildContext context, String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userId = userCredential.user!.uid;

      Provider.of<UserState>(context, listen: false).setUserId(userId);

      DatabaseReference database = FirebaseDatabase.instance.ref();
      await database.child('users').child(userId).set({
        'username': username,
        'email': email,
        'MY Earnings': 0.0,
        'My Rewards': 0.0,
      });

      showToast('Signup Successful');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyMobile(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email');
      }
    } catch (e) {
      showToast('Signup failed');
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        String userId = userCredential.user!.uid;

        Provider.of<UserState>(context, listen: false).setUserId(userId);

        if (userCredential.user != null) {
          DatabaseReference database = FirebaseDatabase.instance.ref();
          await database.child('users').child(userId).set({
            'username': userCredential.user!.displayName ?? 'No Username',
            'email': userCredential.user!.email ?? 'No Email',
            'MY Earnings': 0.0,
            'My Rewards': 0.0,
          });

          showToast('Signup Successful');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => VerifyMobile()),
          );
        } else {
          showToast('Google Sign-in failed');
        }
      } else {
        showToast('Google Sign-in canceled');
      }
    } catch (e) {
      showToast('Google Sign-in failed');
    }
  }

  Future<void> checkGooglePlayServices(BuildContext context) async {
    GooglePlayServicesAvailability availability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability(true);
    if (availability != GooglePlayServicesAvailability.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Google Play Services not available. Please update your Play Store and Play Services.'),
        ),
      );
    }
  }

  Future<void> verifyPhoneNumber(BuildContext context, String phoneNumber, Function(String, String) onCodeSent) async {
    // Add the country code if not already present
    if (!phoneNumber.startsWith('+91')) {
      phoneNumber = '+91' + phoneNumber;
    }

    // Validate and format the phone number to E.164 format
    bool? isValid = await PhoneNumberUtil.isValidPhoneNumber(
      phoneNumber: phoneNumber,
      isoCode: 'IN',
    );

    if (isValid == null || !isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid phone number format. Please enter a valid phone number.'),
        ),
      );
      return;
    }

    String? formattedPhoneNumber = await PhoneNumberUtil.normalizePhoneNumber(
      phoneNumber: phoneNumber,
      isoCode: 'IN',
    );

    if (formattedPhoneNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to format the phone number.'),
        ),
      );
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: formattedPhoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await _auth.signInWithCredential(credential);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Verification completed but sign-in failed: $e'),
            ),
          );
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Verification failed: ${e.message}'),
          ),
        );
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print('Phone number verification failed. Code: ${e.code}. Message: ${e.message}');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId, formattedPhoneNumber);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout
      },
    );
  }
}
