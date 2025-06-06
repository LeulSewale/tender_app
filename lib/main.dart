import 'package:flutter/material.dart';
import 'package:tender_app/app_route.dart';
import 'package:tender_app/features/tender/presentation/screens/auth/registration_page.dart';
import 'package:tender_app/features/tender/presentation/screens/companies/companies_pages.dart';
import 'package:tender_app/features/tender/presentation/screens/selectPackage/select_packege.dart';
import 'package:tender_app/features/tender/presentation/screens/profile/my_profile_page.dart';
import 'package:tender_app/features/tender/presentation/screens/notification/notification_page.dart';
import 'package:tender_app/features/tender/presentation/screens/auth/otp_verfication_page.dart';
import 'package:tender_app/features/tender/presentation/screens/paymentHistory/payment_history.dart';
import 'package:tender_app/features/tender/presentation/screens/home/home_page.dart';
import 'package:tender_app/features/auth/presentation/pages/login_page.dart';
import 'package:tender_app/features/tender/presentation/screens/saveBide/save_bides_page.dart';
import 'package:tender_app/features/tender/presentation/screens/summittedBids/submitted_bids_page.dart';
import 'package:tender_app/features/tender/presentation/screens/tenderInformation/tender_information_page.dart';
import 'package:tender_app/features/tender/presentation/screens/topTenders/top_tendes_page.dart';
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
