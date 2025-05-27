import 'package:flutter/material.dart';
import 'package:tender_app/app_route.dart';
import 'package:tender_app/features/auth/presentation/pages/registration_page.dart';
import 'package:tender_app/features/tender/presentation/screens/select_packege.dart';
import 'package:tender_app/features/tender/presentation/screens/companies_pages.dart';
import 'package:tender_app/features/tender/presentation/screens/my_profile_page.dart';
import 'package:tender_app/features/tender/presentation/screens/notification_page.dart';
import 'package:tender_app/features/tender/presentation/screens/otp_verfication_page.dart';
import 'package:tender_app/features/tender/presentation/screens/payment_history.dart';
import 'package:tender_app/features/tender/presentation/screens/home_page.dart';
import 'package:tender_app/features/auth/presentation/pages/login_page.dart';
import 'package:tender_app/features/tender/presentation/screens/save_bides_page.dart';
import 'package:tender_app/features/tender/presentation/screens/submitted_bids_page.dart';
import 'package:tender_app/features/tender/presentation/screens/tender_information_page.dart';
import 'package:tender_app/features/tender/presentation/screens/top_tendes_page.dart';
// <-- Import AppRoutes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tender App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      theme: ThemeData(
        fontFamily: 'DMSans',
        textTheme: Theme.of(
          context,
        ).textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black),
      ),
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.register: (context) => const RegistrationPage(),
        AppRoutes.selectPackage: (context) => const SelectPackagePage(),
        AppRoutes.tenderList: (context) => HomePage(),
        AppRoutes.otpVerification: (context) => const OtpVerificationPage(),
        AppRoutes.submittedBids: (context) => const SubmittedBidsPage(),
        AppRoutes.myProfile: (context) => const MyProfilePage(),
        AppRoutes.notifications: (context) => const NotificationPage(),
        AppRoutes.paymentHistory: (context) => const PaymentHistoryPage(),
        AppRoutes.tenderInformation: (context) => const TenderInformationPage(),
        AppRoutes.savedBids: (context) => const SavedBidsPage(),
        AppRoutes.topTenders: (context) => const TopTendersPage(),
        AppRoutes.companies: (context) => const CompaniesPage(),
      },
    );
  }
}
