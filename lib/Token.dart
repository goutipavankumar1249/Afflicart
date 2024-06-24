// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:crypto/crypto.dart'; // Import the crypto package for generating HMAC SHA256 signature
//
// void main() {
//   runApp(Token());
// }
//
// class Token extends StatefulWidget {
//   @override
//   _TokenState createState() => _TokenState();
// }
//
// class _TokenState extends State<Token> {
//   String _bearerToken = '';
//
//   Future<String> generateToken(String clientId, String clientSecret) async {
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1/authorize?x-client-';
//
//     // Create a timestamp in milliseconds
//     String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
//     print(timestamp);
//
//     // Generate a SHA256 HMAC signature from the concatenated string: clientId + clientSecret + timestamp
//     String combinedString = '$clientId$clientSecret$timestamp';
//     Digest hmacSha256 = Hmac(sha256, utf8.encode(clientSecret)).convert(utf8.encode(combinedString));
//     String signature = base64.encode(hmacSha256.bytes);
//     print(signature);
//
//     // Create a map with your client ID, client secret, and signature
//     Map<String, String> body = {
//       "clientId": clientId,
//       "clientSecret": clientSecret,
//       "signature": signature,
//     };
//
//     // Convert the map to JSON
//     String jsonBody = json.encode(body);
//
//     // Make a POST request to generate the token
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'x-client-Id' : 'clientId',
//         'x-client-secret' : 'clientSecret',
//         'x-cf-signature' : 'signature',
//         'Content-Type': 'application/json',
//       },
//       body: jsonBody,
//     );
//
//     // Check if the request was successful
//     if (response.statusCode == 200) {
//       print('success to generate token: ${response.statusCode}');
//       // Parse the response JSON
//       Map<String, dynamic> responseData = json.decode(response.body);
//       // Print the responseData for debugging
//       print('Response Data: $responseData');
//       // Access the 'data' object using null-aware operator
//       dynamic data = responseData['data'];
//       String token='egdhsfhi';
//       // Check if data is not null before accessing the 'token' key
//       if (data != null) {
//         print('hello');
//         // String token = data['token'];
//         // // Print the token to the console
//         // print('Token: $token');
//       } else {
//         print('Data is null');
//       }
//
//
//       return token;
//     } else {
//       // If the request was not successful, print the error
//       print('Failed to generate token: ${response.statusCode}');
//       throw Exception('Failed to generate token');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cashfree Authentication Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 String clientId = 'CF10181264COOHSKVNBS54E92K7JF0';
//                 String clientSecret = 'cfsk_ma_test_e7c48d387bc6a1ba7f81413cd20fa835_10e4adb0';
//
//                 try {
//                   String token = await generateToken(clientId, clientSecret);
//                   setState(() {
//                     _bearerToken = token;
//                   });
//                   print('Generated Token: $token');
//                 } catch (e) {
//                   print('Error: $e');
//                 }
//               },
//               child: Text('Authenticate'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Bearer Token:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               _bearerToken,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:crypto/crypto.dart'; // Import the crypto package for generating HMAC SHA256 signature
//
// void main() {
//   runApp(Token());
// }
//
// class Token extends StatefulWidget {
//   @override
//   _TokenState createState() => _TokenState();
// }
//
// class _TokenState extends State<Token> {
//   String _bearerToken = '';
//
//
//   // this is the final code for the generating code
//
//
//   Future<String> generateToken(String clientId, String clientSecret) async {
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1/authorize?x-client-';
//     // Create a timestamp in milliseconds
//     String timestamp = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     print(timestamp);
//
//     // Generate a SHA256 HMAC signature from the concatenated string: clientId + clientSecret + timestamp
//     String combinedString = '$clientId$clientSecret$timestamp';
//     Digest hmacSha256 = Hmac(sha256, utf8.encode(clientSecret)).convert(
//         utf8.encode(combinedString));
//     String signature = base64.encode(hmacSha256.bytes);
//     print(signature);
//
//     // Create a map with your client ID, client secret, and signature
//     Map<String, String> body = {
//       "clientId": clientId,
//       "clientSecret": clientSecret,
//       "signature": signature,
//     };
//
//     // Convert the map to JSON
//     String jsonBody = json.encode(body);
//
//     // Make a POST request to generate the token
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'x-client-Id': 'CF10181264COOHSKVNBS54E92K7JF0',
//         'x-client-secret': 'cfsk_ma_test_e7c48d387bc6a1ba7f81413cd20fa835_10e4adb0',
//         'x-cf-signature': 'signature',
//         'Content-Type': 'application/json',
//       },
//       body: jsonBody,
//     );
//
//     // Check if the request was successful
//     if (response.statusCode == 200) {
//       print('success to generate token: ${response.statusCode}');
//       // Parse the response JSON and extract the token
//       Map<String, dynamic> responseData = json.decode(response.body);
//       dynamic data = responseData['data'];
//       String token = data['token'];
//       print(token);
//       return token;
//     } else {
//       // If the request was not successful, print the error
//       print('Failed to generate token: ${response.statusCode}');
//       throw Exception('Failed to generate token');
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cashfree Authentication Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 String clientId = 'CF10181264COOHSKVNBS54E92K7JF0';
//                 String clientSecret = 'cfsk_ma_test_e7c48d387bc6a1ba7f81413cd20fa835_10e4adb0';
//
//                 try {
//                   String token = await generateToken(clientId, clientSecret);
//                   setState(() {
//                     _bearerToken = token;
//                   });
//                 } catch (e) {
//                   print('Error: $e');
//                 }
//               },
//               child: Text('Authenticate'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Bearer Token:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               _bearerToken,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// this is the final one we cannot change it


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:crypto/crypto.dart'; // Import the crypto package for generating HMAC SHA256 signature
//
// void main() {
//   runApp(Token());
// }
//
// class Token extends StatefulWidget {
//   @override
//   _TokenState createState() => _TokenState();
// }
//
// class _TokenState extends State<Token> {
//   String _bearerToken = '';
//
//
//   // this is the final code for the generating code
//
//
//   Future<String> generateToken(String clientId, String clientSecret) async {
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1/authorize?x-client-';
//     // Create a timestamp in milliseconds
//     String timestamp = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     print(timestamp);
//
//     // Generate a SHA256 HMAC signature from the concatenated string: clientId + clientSecret + timestamp
//     String combinedString = '$clientId$clientSecret$timestamp';
//     Digest hmacSha256 = Hmac(sha256, utf8.encode(clientSecret)).convert(
//         utf8.encode(combinedString));
//     String signature = base64.encode(hmacSha256.bytes);
//     print(signature);
//
//     // Create a map with your client ID, client secret, and signature
//     Map<String, String> body = {
//       "clientId": clientId,
//       "clientSecret": clientSecret,
//       "signature": signature,
//     };
//
//     // Convert the map to JSON
//     String jsonBody = json.encode(body);
//
//     // Make a POST request to generate the token
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'x-client-Id': 'CF10181264COOHSKVNBS54E92K7JF0',
//         'x-client-secret': 'cfsk_ma_test_e7c48d387bc6a1ba7f81413cd20fa835_10e4adb0',
//         'x-cf-signature': 'signature',
//         'Content-Type': 'application/json',
//       },
//       body: jsonBody,
//     );
//
//     // Check if the request was successful
//     if (response.statusCode == 200) {
//       print('success to generate token: ${response.statusCode}');
//       // Parse the response JSON and extract the token
//       Map<String, dynamic> responseData = json.decode(response.body);
//       dynamic data = responseData['data'];
//       String token = data['token'];
//       print(token);
//       verifyToken(token);
//       return token;
//     } else {
//       // If the request was not successful, print the error
//       print('Failed to generate token: ${response.statusCode}');
//       throw Exception('Failed to generate token');
//     }
//
//   }
//   Future<void> verifyToken(String token) async {
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1/verifyToken?';
//     print(token);
//     String intial1 = 'Bearer';
//     String intial2 = token;
//     String ans = intial1 + ' ' + intial2;;
//     print(ans);
//     // Make a POST request to verify the token
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Authorization' : ans,
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({'token': token}),
//     );
//
//     // Check if the request was successful
//     if (response.statusCode == 200) {
//       // Parse the response JSON
//       Map<String, dynamic> responseData = json.decode(response.body);
//       // Check if the status indicates success
//       if (responseData.containsKey('status') && responseData['status'] == 'SUCCESS') {
//         // Check if the token is valid
//         print(responseData);
//         String isValid = responseData['message'];
//         print(isValid);
//         addBenificiary(ans);
//         //return isValid;
//       } else {
//         // If the response indicates an error, print the error message
//         String errorMessage = responseData['message'] ?? 'Unknown error';
//         print('Failed to verify token: $errorMessage');
//         //return false;
//       }
//     } else {
//       // If the request was not successful, print the error
//       print('Failed to verify token: ${response.statusCode}');
//       //return false;
//     }
//   }
//
//   Future<void> addBenificiary(String token) async {
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1/addBeneficiary?Authorization';
//
//     // Authorization token
//     final String authToken =token;
//
//     // Body of the request
//     Map<String, dynamic> requestBody = {
//       // "name": "John Doe",
//       // "email": "john@example.com",
//       // "phone": "9876543210",
//       "bankAccount": "73187924461",
//       "ifsc": "APGV0004132",
//       //"address1": "123 Main St",
//       // "city": "Bangalore",
//       // "state": "Karnataka",
//       // "pincode": "560001",
//       // "merchantId": "M123456",
//       // "contactName": "John Doe",
//       // "contactPhone": "9876543210",
//       // "contactEmail": "john@example.com"
//       "beneId": "saketh",
//       "name": "pandrameesu sathish",
//       "email": "pvs@gmail.com",
//       "phone": "8712371955",
//       "address1": "basar"
//     };
//
//     // Convert the request body to JSON
//     String jsonBody = json.encode(requestBody);
//     print(jsonBody);
//
//     // Make a POST request to add the beneficiary
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Authorization': authToken,
//         'Content-Type': 'application/json',
//       },
//       body: jsonBody,
//     );
//
//     // Check if the request was successful
//     if (response.statusCode == 200) {
//       // Parse the response JSON
//       Map<String, dynamic> responseData = json.decode(response.body);
//       print('Response Data: $responseData');
//       String result = responseData['message'];
//       print(result);
//       transferMoney(authToken);
//     } else {
//       // If the request was not successful, print the error
//       print('Failed to add beneficiary: ${response.statusCode}');
//       print('Error Message: ${response.body}');
//     }
//   }
//
//   Future<void> transferMoney(String token) async {
//     // Replace with your Cashfree API endpoint
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1.2/requestAsyncTransfer';
//
//     // Replace with your authentication token
//     //final String authToken = '';
//
//     // Replace with your beneficiary details and transfer amount
//     Map<String, dynamic> requestBody = {
//       "beneId": 'saketh',
//       "transferId": "0082",
//       "amount": "100"
//     };
//
//     // Encode the request body as JSON
//     String jsonBody = json.encode(requestBody);
//
//     // Make a POST request to the Cashfree API
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Authorization':token,
//         'Content-Type': 'application/json',
//       },
//       body: jsonBody,
//     );
//
//     // Check if the request was successful
//     if (response.statusCode == 200) {
//       // Parse the response JSON
//       Map<String, dynamic> responseData = json.decode(response.body);
//       print('Response Data: $responseData');
//       String result = responseData['message'];
//       print(result);
//       //getTransferStatus(token,0002);
//     } else {
//       // If the request was not successful, print the error
//       print('Failed to transfer money: ${response.statusCode}');
//       print('Error message: ${response.body}');
//     }
//   }
//
//   Future<void> getTransferStatus(String token,String referenceId) async {
//     // Replace with your Cashfree API endpoint
//     final String url = 'https://payout-gamma.cashfree.com/payout/v1.2/getTransferStatus?transferId=$referenceId';
//
//     // Replace with your authentication token
//     //final String authToken = 'YOUR_AUTHENTICATION_TOKEN';
//
//     // Make a POST request to the Cashfree API
//     final response = await http.get(
//       Uri.parse(url),
//       headers: {
//         'Authorization':token,
//         'Content-Type': 'application/json',
//       },
//     );
//
//     // Check if the request was successful
//     if (response.statusCode == 200) {
//       // Parse the response JSON
//       Map<String, dynamic> responseData = json.decode(response.body);
//       print('Transfer status: $responseData');
//       print(responseData['message']);
//     } else {
//       // If the request was not successful, print the error
//       print('Failed to get transfer status: ${response.statusCode}');
//       print('Error message: ${response.body}');
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cashfree Authentication Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () async {
//                 String clientId = 'CF10181264COOHSKVNBS54E92K7JF0';
//                 String clientSecret = 'cfsk_ma_test_e7c48d387bc6a1ba7f81413cd20fa835_10e4adb0';
//
//                 try {
//                   String token = await generateToken(clientId, clientSecret);
//                   setState(() {
//                     _bearerToken = token;
//                   });
//                 } catch (e) {
//                   print('Error: $e');
//                 }
//               },
//               child: Text('Authenticate'),
//             ),
//
//             ElevatedButton(
//               onPressed: () async {
//                 await getTransferStatus('Bearer eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJZCI6IkNGMTAxODEyNjRDT09IU0tWTkJTNTRFOTJLN0pGMCIsImFjY291bnRJZCI6NjI4NzUyLCJzaWduYXR1cmVDaGVjayI6ZmFsc2UsImlwIjoiMTUyLjU5LjE5Mi4yMTgiLCJhZ2VudCI6IlBBWU9VVCIsImNoYW5uZWwiOiIiLCJhZ2VudElkIjo2Mjg3NTIsImtpZCI6IkNGMTAxODEyNjRDT09IU0tWTkJTNTRFOTJLN0pGMCIsImVuYWJsZUFwaSI6dHJ1ZSwiZXhwIjoxNzE1MTY3MDYzLCJpYXQiOjE3MTUxNjY0NjMsInN1YiI6IlBBWU9VVEFQSV9BVVRIIn0.oijIg84-W4U3v7qlHAUUayaJ7arCnAYk453W0f1mwgMSRMGpEl-1_9jNZoODsraP','0082');
//               },
//               child: Text('get status'),
//             ),
//
//             SizedBox(height: 20),
//             Text(
//               'Bearer Token:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               _bearerToken,
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'dart:typed_data';
import 'package:asn1lib/asn1lib.dart';

class Token extends StatefulWidget {
  @override
  _TokenState createState() => _TokenState();
}

class _TokenState extends State<Token> {
  late DatabaseReference _userRef;
  String _username = '';
  String _email = '';
  String _phone = '';
  String _beneId = '';
  String _address1 = '';
  String _bankAccount = '';
  String _ifsc = '';

  @override
  void initState() {
    super.initState();
    // Initialize DatabaseReference with the users node and user ID
    _userRef = FirebaseDatabase.instance.ref().child('users').child('tFLZ39H2DZQpgkybWx2BlWSTKCa2');
    // Fetch user information when the page is initialized
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      // Use `once()` method to get a single snapshot of the data
      DataSnapshot snapshot = await _userRef.once().then((event) => event.snapshot);

      // Extract the value from the event and cast it to a Map<dynamic, dynamic>
      Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
      if (userData != null) {
        // Update the state with the fetched user information
        setState(() {
          _username = userData['username'] ?? '';
          _email = userData['email'] ?? '';
          _phone = userData['phoneNumber'] ?? '';
          _beneId = userData['beneId'] ?? '';
          _bankAccount = userData['accountNumber'] ?? '';
          _ifsc = userData['ifscCode'] ?? '';
          _address1 = userData['address1'] ?? '';
          String clientId = 'CF10180708CP5EDP9BRFKLVP14O2B0';
          String clientSecret = 'cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19';
          //generateToken(clientId, clientSecret);
        });
      } else {
        print('User data not found');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  Future<String> generateToken(String clientId, String clientSecret) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/authorize';
    const String publicKey = """-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtsVN2+BBHWdlEKSfMpoy
6WiXOfYDfCegrpHnKEX04OBENOOMh5wuibLCVSJFFc3VISRTYYhRF3OR7HLDdU8e
/ahAqbPfeCQKkXOrq7tIncguoc3KhzyeC2yMLXpbqZBiYsNRSUjdjU6prCkn5jF0
RqaKAbKgjA839VO3dpLQDmeTm8ta9eZybleAF4xZ1ZgIVB30EXGRih/5w7/fS8fs
wEZUgzg9nthIvc/PABZm2lX9k3i8QX+EcF4+1unuTMvuGPeefNgUOTv8NmC43+/N
usRBe6Z1Q228srlGaWlC6ww5Bni2wrIfhkaAk+ta1LsU/IKQC7G1oYSoY7rXrfq3
rQIDAQAB
-----END PUBLIC KEY-----
""";
    final String signature = await generateSignature(clientId, publicKey);
    print('Generated Signature: $signature');

    // Create a map with your client ID, client secret, and signature
    Map<String, String> body = {
      "clientId": clientId,
      "clientSecret": clientSecret,
      "signature": signature,
    };

    // Convert the map to JSON
    String jsonBody = json.encode(body);

    // Make a POST request to generate the token
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'x-client-Id' : 'CF10180708CP5EDP9BRFKLVP14O2B0',
       'x-client-secret' : 'cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19',
         'x-cf-signature' : signature,
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      dynamic data = responseData['data'];
      String token = data['token'];
      verifyToken(token);
      return token;
    } else {
      throw Exception('Failed to generate token: ${response.statusCode}');
    }
  }

  Future<void> verifyToken(String token) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/verifyToken';
    final String authHeader = 'Bearer $token';

    // Make a POST request to verify the token
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': authHeader,
        'Content-Type': 'application/json',
      },
      body: json.encode({'token': token}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData.containsKey('status') && responseData['status'] == 'SUCCESS') {
        addBeneficiary(authHeader);
      } else {
        print('Failed to verify token: ${responseData['message']}');
      }
    } else {
      print('Failed to verify token: ${response.statusCode}');
    }
  }

  Future<void> addBeneficiary(String token) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/addBeneficiary';

    // Body of the request
    Map<String, dynamic> requestBody = {
      "bankAccount": _bankAccount,
      "ifsc": _ifsc,
      "beneId": _beneId,
      "name": _username,
      "email": _email,
      "phone": _phone,
      "address1": _address1
    };

    // Convert the request body to JSON
    String jsonBody = json.encode(requestBody);

    // Make a POST request to add the beneficiary
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      print('Response Data: $responseData');
      transferMoney(token);
    } else {
      print('Failed to add beneficiary: ${response.statusCode}');
    }
  }

  Future<void> transferMoney(String token) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1.2/requestAsyncTransfer';

    Map<String, dynamic> requestBody = {
      "beneId": _beneId,
      "transferId": "6533",
      "amount": "1000"
    };

    String jsonBody = json.encode(requestBody);

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      print('Response Data: $responseData');
      getTransferStatus(token, '6533');
    } else {
      print('Failed to transfer money: ${response.statusCode}');
    }
  }

  Future<void> getTransferStatus(String token, String transferId) async {
    final String url = 'https://payout-gamma.cashfree.com/payout/v1.2/getTransferStatus?transferId=$transferId';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      print('Transfer status: $responseData');
    } else {
      print('Failed to get transfer status: ${response.statusCode}');
    }
  }

  Future<String> generateSignature(String clientId, String publicKeyPem) async {
    // Get current timestamp in seconds
    final int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    // Create the data to encrypt
    final String dataToEncrypt = '$clientId.$timestamp';

    // Parse the PEM key
    final RSAPublicKey publicKey = parsePublicKeyFromPem(publicKeyPem);

    // Encrypt the data using RSA/ECB/OAEPWithSHA-1AndMGF1Padding
    final Uint8List encryptedData = encryptDataWithOAEP(publicKey, dataToEncrypt);

    // Return the base64 encoded encrypted data
    return base64Encode(encryptedData);
  }

  RSAPublicKey parsePublicKeyFromPem(String pem) {
    final List<String> lines = pem.split('\n');
    final String base64String = lines
        .where((line) => !line.startsWith('-----BEGIN') && !line.startsWith('-----END'))
        .join('');

    final Uint8List publicKeyDER = base64Decode(base64String);
    final ASN1Parser asn1Parser = ASN1Parser(publicKeyDER);
    final ASN1Sequence sequence = asn1Parser.nextObject() as ASN1Sequence;

    final  ASN1BitString bitString = sequence.elements[1] as ASN1BitString;
    final ASN1Sequence publicKeySequence =
    ASN1Parser(bitString.contentBytes()).nextObject() as ASN1Sequence;

    final ASN1Integer modulus = publicKeySequence.elements[0] as ASN1Integer;
    final ASN1Integer exponent = publicKeySequence.elements[1] as ASN1Integer;

    return RSAPublicKey(modulus.valueAsBigInteger, exponent.valueAsBigInteger);
  }

  Uint8List encryptDataWithOAEP(RSAPublicKey publicKey, String data) {
    final OAEPEncoding cipher = OAEPEncoding(RSAEngine())
      ..init(
        true, // true=encrypt
        PublicKeyParameter<RSAPublicKey>(publicKey),
      );

    final Uint8List input = Uint8List.fromList(utf8.encode(data));
    return cipher.process(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Token Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username: $_username'),
            Text('Email: $_email'),
            Text('Phone: $_phone'),
            ElevatedButton(
              onPressed: () {
                String clientId = 'CF10180708CP5EDP9BRFKLVP14O2B0';
                String clientSecret = 'cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19';
                generateToken(clientId, clientSecret);
              },
              child: Text('Generate Token'),
            ),
          ],
        ),
      ),
    );
  }
}







