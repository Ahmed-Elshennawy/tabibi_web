// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:local_auth/local_auth.dart';

// class BiometricAuthService {
//   final LocalAuthentication  _localAuth = LocalAuthentication ();
//   final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

//   // Check if biometric authentication is available
//   Future<bool> isBiometricAvailable() async {
//     return await _localAuth.canCheckBiometrics || await _localAuth.isDeviceSupported();
//   }

//   // Authenticate with biometrics
//   Future<bool> authenticateWithBiometrics() async {
//     return await _localAuth.authenticate(
//       localizedReason: 'Authenticate to log in',
//       options: const AuthenticationOptions(
//         biometricOnly: true, // Only biometrics, no fallback to device credentials
//       ),
//     );
//   }

//   // Save credentials securely
//   Future<void> saveCredentials(String email, String password) async {
//     await _secureStorage.write(key: 'email', value: email);
//     await _secureStorage.write(key: 'password', value: password);
//   }

//   // Retrieve saved credentials
//   Future<Map<String, String?>> getCredentials() async {
//     final email = await _secureStorage.read(key: 'email');
//     final password = await _secureStorage.read(key: 'password');
//     return {'email': email, 'password': password};
//   }

//   // Clear saved credentials (e.g., on logout)
//   Future<void> clearCredentials() async {
//     await _secureStorage.delete(key: 'email');
//     await _secureStorage.delete(key: 'password');
//   }
// }