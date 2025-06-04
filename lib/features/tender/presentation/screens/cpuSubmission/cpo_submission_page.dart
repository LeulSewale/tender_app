import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';
import 'package:tender_app/features/tender/presentation/widgets/section_title.dart';

class CpoSubmissionScreen extends StatelessWidget {
  final TextEditingController _transactionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Submit CPO', style: TextStyle(fontFamily: "DMSans")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SectionTitle(title: 'Documents'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                DownloadButton(label: 'Procurement proced...'),
                DownloadButton(label: 'Company Profile'),
                DownloadButton(label: 'List of Items'),
              ],
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'CPO Information'),
            InfoRow(
              label1: 'Amount',
              value1: '500,000 Birr',
              label2: 'Due Date',
              value2: '9 Jan 2025',
            ),
            InfoRow(
              label1: 'Bank Name',
              value1: 'Dashen Bank',
              label2: 'Bank Account Number',
              value2: '100189127912',
            ),
            SizedBox(height: 20),
            SectionTitle(title: 'CPO Submission Form'),
            Text(
              'Upload Payment Slip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "DMSans",
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // TODO: handle file picker
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.upload, color: AppColors.primaryColor),
                    SizedBox(width: 10),
                    Text(
                      'Upload Payment Slip',
                      style: TextStyle(fontFamily: "DMSans"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Transaction Number',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "DMSans",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _transactionController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintText: 'TX12312399812',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StepCircle(number: 1, isActive: true),
                StepCircle(number: 2, isActive: true),
                StepCircle(number: 3, isActive: false),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // TODO: Handle CPO submit
              },
              child: Text(
                'Submit CPO',
                style: TextStyle(color: Colors.white, fontFamily: "DMSans"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
