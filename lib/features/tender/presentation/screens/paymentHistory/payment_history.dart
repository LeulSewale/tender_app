import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';
import 'package:tender_app/features/tender/presentation/widgets/info_column.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  final List<PaymentHistoryItem> notifications = [
    PaymentHistoryItem(
      icon: Icons.payment,
      title: 'Payment for Pipeline Tender',
      detail:
          'You’ve successfully paid for the Water Pipeline Tender application. Submission deadline in 2 days.',
      price: '1000 Birr',
    ),
    PaymentHistoryItem(
      icon: Icons.payment,
      title: 'Payment for Road Tender',
      detail:
          'You’ve completed payment for the Road Construction Tender in the Addis Ababa region.',
      price: '1000 Birr',
    ),
    PaymentHistoryItem(
      icon: Icons.payment,
      title: 'Payment for Telecom Tender',
      detail:
          'Payment received for the Telecom Infrastructure Tender. Your bid has been submitted.',
      price: '2000 Birr',
    ),
  ];

  final Set<int> expandedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "DMSans",
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              // Wrap the Card with Expanded
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: notifications.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    final isExpanded = expandedIndexes.contains(index);
                    return Card(
                      elevation: 0,
                      color: Colors.white,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  226,
                                  234,
                                  240,
                                ),
                                child: Icon(
                                  item.icon,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "DMSans",
                                      ),
                                    ),
                                    if (isExpanded)
                                      Text(
                                        item.price,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "DMSans",
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (isExpanded) {
                                      expandedIndexes.remove(index);
                                    } else {
                                      expandedIndexes.add(index);
                                    }
                                  });
                                },
                                child: Text(
                                  isExpanded ? 'Hide Detail' : 'View Detail',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: "DMSans",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (isExpanded)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Divider(thickness: 0.1, height: 24),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InfoColumn(
                                          label: 'Amount',
                                          value: '250 Birr',
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: InfoColumn(
                                          label: 'Payment Method',
                                          value: 'Telebirr',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  InfoColumn(
                                    label: 'Reason',
                                    value: 'Document Payment for TENDER-1234',
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentHistoryItem {
  final IconData icon;
  final String title;
  final String detail;
  final String price;

  PaymentHistoryItem({
    required this.icon,
    required this.title,
    required this.detail,
    this.price = '0 Birr', // Add a default value for price
  });
}
