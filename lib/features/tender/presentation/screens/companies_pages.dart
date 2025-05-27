import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  // Dummy companies list
  final List<Map<String, dynamic>> companies = const [
    {
      'logoUrl': 'https://via.placeholder.com/50',
      'name': 'Hailom Trading PLC',
      'tenderCount': 12,
    },
    {
      'logoUrl': 'https://via.placeholder.com/50',
      'name': 'Ethio Telecom',
      'tenderCount': 8,
    },
    {
      'logoUrl': 'https://via.placeholder.com/50',
      'name': 'Ministry of Education',
      'tenderCount': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Companies',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "DMSans"),
        ),
        centerTitle: true,

        elevation: 0,
        leading: const BackButton(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];
          return Card(
            color: AppColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                backgroundImage: NetworkImage(company['logoUrl']),
                onBackgroundImageError: (_, __) {
                  // handled by fallback below
                },
                child: Image.asset('assets/images/placeholder.png'),
              ),

              title: Text(
                company['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "DMSans",
                ),
              ),
              subtitle: Text(
                '${company['tenderCount']} active tenders',
                style: TextStyle(color: Colors.grey[700], fontFamily: "DMSans"),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).pushNamed('/tender_list');
              },
            ),
          );
        },
      ),
    );
  }
}
