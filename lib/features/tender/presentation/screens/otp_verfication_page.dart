import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String otp = '';

  void _submitOtp() {
    if (otp.length == 4) {
      Navigator.of(context).pushReplacementNamed('/selected_package');

      print('Submitted OTP: $otp');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter 4-digit OTP",
            style: TextStyle(fontFamily: 'DMSans'),
          ),
        ),
      );
    }
  }

  void _resendOtp() {
    // Handle resend
    print('Resend OTP');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Enter OTP Code",
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'DMSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Enter the 4-digit code sent to your number",
              style: TextStyle(fontSize: 16, fontFamily: 'DMSans'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            PinCodeTextField(
              appContext: context,
              length: 4,
              onChanged: (value) {
                otp = value;
              },
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 50,
                activeColor: Colors.black,
                selectedColor: AppColors.primaryColor,
                inactiveColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'DMSans',
                ),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _resendOtp,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Resend",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'DMSans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
