import 'package:flutter/material.dart';
import 'package:tender_app/features/tender/presentation/widgets/tender_card.dart';

class TopTendersPage extends StatelessWidget {
  const TopTendersPage({super.key});

  // Simulate a list of saved tenders using TenderCard (can be from Provider/BLoC)
  final List<Widget> savedTenderCards = const [
    TenderCard(),
    TenderCard(),
    TenderCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Tendes',
          style: TextStyle(fontFamily: 'DMSans', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfff2f3f7),
        elevation: 0,
        leading: const BackButton(),
      ),
      body:
          savedTenderCards.isEmpty
              ? const Center(
                child: Text(
                  'No saved tenders yet.',
                  style: TextStyle(fontFamily: 'DMSans', fontSize: 16),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                itemCount: savedTenderCards.length,
                itemBuilder: (context, index) => savedTenderCards[index],
              ),
    );
  }
}
