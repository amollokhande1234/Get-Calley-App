import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  final String _registerUrl =
      'https://mock-api.calleyacd.com/api/auth/register';
  // final String _loginUrl = 'https://mock-api.calleyacd.com/api/auth/login';
  final String _sendOtpUrl = 'https://mock-api.calleyacd.com/api/auth/send-otp';
  final String _verifyOtpUrl =
      'https://mock-api.calleyacd.com/api/auth/verify-otp';

  /// Register API
  Future<bool> register(
    String name,
    String email,
    String pass,
    BuildContext context,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(_registerUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': pass, 'username': name}),
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        OTPSend(email, context);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Register error: $e");
      return false;
    }
  }

  /// Send OTP API
  Future<bool> OTPSend(String email, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(_sendOtpUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      if (response.statusCode == 200) {
        print("OTP SENDed:");
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("OTP sent to Email"),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        }
      }
    } catch (e) {
      print("Error sending OTP: $e");
    }
    return false;
  }

  /// Verify OTP API
  Future<bool> verifyOtp(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse(_verifyOtpUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "otp": otp}),
      );
      print(response.statusCode.toString() + '  EIEIHFHSA');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data['success']);
        return true;
      }
    } catch (e) {
      print("Error verifying OTP: $e");
    }
    return false;
  }
}
