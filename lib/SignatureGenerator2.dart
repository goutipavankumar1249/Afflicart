import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pointycastle/export.dart';
import 'package:asn1lib/asn1lib.dart';
import 'package:http/http.dart' as http;

class SignatureGenerator2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signature and Token Generator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  const String clientId = "CF10180708CP5EDP9BRFKLVP14O2B0";
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

                  try {
                    final String signature = await generateSignature(clientId, publicKey);
                    print('Generated Signature: $signature');
                  } catch (e) {
                    print('Error generating signature: $e');
                  }
                },
                child: Text('Generate Signature'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  const String clientId = "CF10180708CP5EDP9BRFKLVP14O2B0";
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

                  try {
                    final String token = await generateToken(clientId, publicKey);
                    print('Generated Token: $token');
                  } catch (e) {
                    print('Error generating token: $e');
                  }
                },
                child: Text('Generate Token'),
              ),
            ],
          ),
        ),
      ),
    );
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

  Future<String> generateToken(String clientId, String publicKeyPem) async {
    // Generate RSA signature
    final String signature = await generateSignature(clientId, publicKeyPem);

    // Create a map with your client ID and signature
    Map<String, String> body = {
      "clientId": clientId,
      "signature": signature,
    };

    // Convert the map to JSON
    String jsonBody = json.encode(body);

    // Define the URL
    final String url = 'https://payout-gamma.cashfree.com/payout/v1/authorize';

    // Make a POST request to generate the token
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'x-client-Id': clientId,
        'x-client-secret': 'cfsk_ma_test_0a6279ba7f0a2e722564bdb922ab9aa9_ed6b5c19',
        'x-cf-signature': signature,
      },
      body: jsonBody,
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      print('Success generating token: ${response.statusCode}');
      // Parse the response JSON and extract the token
      Map<String, dynamic> responseData = json.decode(response.body);
      dynamic data = responseData['data'];
      String token = data['token'];
      print(token);
      return token;
    } else {
      // If the request was not successful, print the error
      print('Failed to generate token: ${response.statusCode}');
      throw Exception('Failed to generate token');
    }
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

}

void main() => runApp(SignatureGenerator2());

