import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';

class SelectPackagePage extends StatefulWidget {
  const SelectPackagePage({super.key});

  @override
  State<SelectPackagePage> createState() => _SelectPackagePageState();
}

class _SelectPackagePageState extends State<SelectPackagePage> {
  int selectedIndex = 2; // default selected (0, 1, 2)

  final packages = [
    {
      "title": "3 Month Package",
      "description":
          "Get a full year of uninterrupted access to exclusive tenders with our 3 Month Bidding Subscription. With comprehensive features including unlimited bid submissions, advanced notifications, and priority support, this long–term plan ensures you're always in the loop and ready to seize every opportunity.",
      "price": "1,500 Birr",
    },
    {
      "title": "6 Month Package",
      "description":
          "Get a full year of uninterrupted access to exclusive tenders with our 6 Month Bidding Subscription. With comprehensive features including unlimited bid submissions, advanced notifications, and priority support, this long–term plan ensures you're always in the loop and ready to seize every opportunity.",
      "price": "2,000 Birr",
    },
    {
      "title": "1 Year Package",
      "description":
          "Get a full year of uninterrupted access to exclusive tenders with our 1-Year Bidding Subscription. With comprehensive features including unlimited bid submissions, advanced notifications, and priority support, this long–term plan ensures you're always in the loop and ready to seize every opportunity.",
      "price": "2,500 Birr",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Package",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'DMSans',
              ),
            ),
            const Text(
              "Please choose a package that best suits your needs.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'DMSans',
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.separated(
                itemCount: packages.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color:
                              isSelected
                                  ? AppColors.primaryColor
                                  : Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  packages[index]['title']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DMSans',
                                  ),
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            packages[index]['description']!,
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: 'DMSans',
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Price",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                              Text(
                                packages[index]['price']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible:
                        false, // Prevent dismiss by tapping outside
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        icon: Icon(
                          Icons.library_add_check_outlined,
                          color: AppColors.primaryColor,
                          size: 30,
                        ),
                        title: Text(
                          '🎉 Account Create Succesfully',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        content: const Text(
                          textAlign: TextAlign.center,
                          'You account has been created successfully! You can now log in and start bidding using our services.',
                          style: TextStyle(fontFamily: 'DMSans'),
                        ),
                        actions: [
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                Navigator.of(
                                  context,
                                ).pushNamed('/tender_list'); // Navigate
                              },
                              child: const Text(
                                'Finished',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
