import 'dart:io';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';
import 'package:tender_app/features/tender/presentation/widgets/info_column.dart';
import 'package:tender_app/features/tender/presentation/widgets/custom_card.dart';
import 'package:tender_app/features/tender/presentation/widgets/section_header.dart';
import 'package:tender_app/features/tender/presentation/widgets/custom_divider.dart';
import 'package:tender_app/features/tender/presentation/widgets/info_row.dart';
import 'package:image_picker/image_picker.dart';

class TenderInformationPage extends StatefulWidget {
  const TenderInformationPage({super.key});

  @override
  State<TenderInformationPage> createState() => _TenderInformationPageState();
}

class _TenderInformationPageState extends State<TenderInformationPage> {
  int activeStep = 0;
  String buttonText = 'Purchase Documents (200 ETB)';
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomCard(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (activeStep == 0) ...[
                  const SectionHeader(
                    icon: Icons.notes_rounded,
                    title: 'Tender Information',
                  ),
                  const CustomDivider(),
                  const InfoRow(
                    columns: [
                      InfoColumn(
                        label: 'Company',
                        value: 'ABC Construction PLC',
                      ),
                      InfoColumn(
                        label: 'Tender Title',
                        value: 'Building Construction',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const InfoRow(
                    columns: [
                      InfoColumn(
                        label: 'Category/Sector',
                        value: 'Construction',
                      ),
                      InfoColumn(label: 'Reference Number', value: 'REF-234X'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SectionHeader(icon: Icons.timeline, title: 'Timeline'),
                  const CustomDivider(),
                  const InfoRow(
                    columns: [
                      InfoColumn(
                        label: 'Publication Date',
                        value: '2023-10-01',
                      ),
                      InfoColumn(label: 'Bid Deadline', value: '2023-10-15'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const InfoRow(
                    columns: [
                      InfoColumn(
                        label: 'Contract Award Date',
                        value: '2023-11-01',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SectionHeader(
                    icon: Icons.description,
                    title: 'Tender Description',
                  ),
                  const CustomDivider(),
                  const InfoColumn(
                    label: 'Tender Description',
                    value:
                        'Traidal Technologies is a subsidiary of Tridal Trading PLC and an Ethiopian tech company focused on custom software development and business infrastructure solutions...',
                  ),
                ] else if (activeStep == 1) ...[
                  const SectionHeader(
                    icon: Icons.description,
                    title: 'Documents',
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: List.generate(
                      3,
                      (index) => Chip(
                        label: const Text(
                          "📄 Document",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        avatar: Icon(
                          Icons.file_download_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SectionHeader(
                    icon: Icons.event_note_outlined,
                    title: 'CPO Information',
                  ),
                  const CustomDivider(),
                  const InfoRow(
                    columns: [
                      InfoColumn(label: 'Amount', value: '5000,00 Birr'),
                      InfoColumn(label: 'Due Date', value: '2023-10-15'),
                    ],
                  ),
                  const InfoRow(
                    columns: [
                      InfoColumn(label: 'Bank Name', value: 'Dashen Bank'),
                      InfoColumn(
                        label: 'Bank Account Number',
                        value: '1234567890',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const SectionHeader(
                    icon: Icons.event_note_outlined,
                    title: 'CPO Submission Form',
                  ),
                  const CustomDivider(),
                  Text(
                    'Upload Payment Slip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.file_upload_outlined,
                                color: AppColors.primaryColor,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _selectedImage == null
                                  ? 'Tap to upload'
                                  : 'Image Selected',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                                fontFamily: 'DMSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_selectedImage != null) ...[
                    const SizedBox(height: 16),
                    Image.file(
                      File(_selectedImage!.path),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                  const SizedBox(height: 24),
                  Text(
                    'Transaction Number',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'TX123G6870970',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                    ),
                  ),
                ] else if (activeStep == 2) ...[
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.library_add_check_outlined,
                          color: AppColors.primaryColor,
                          size: 40,
                        ),
                        const Text(
                          'BID Submitted Successfully',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DMSans',
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Your account has been created successfully! You can now log in and start bidding using our services.',
                          style: TextStyle(fontFamily: 'DMSans'),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                EasyStepper(
                  activeStep: activeStep,
                  lineStyle: const LineStyle(
                    lineType: LineType.dotted, // Make it a broken line
                    lineLength: 80,
                    lineThickness: 2,
                    activeLineColor: Colors.black,
                    defaultLineColor: AppColors.primaryColor,
                  ),
                  internalPadding: 0,
                  showLoadingAnimation: false,
                  stepRadius: 18,
                  steps: List.generate(3, (index) {
                    final isSelected = activeStep >= index;
                    return EasyStep(
                      customStep: CircleAvatar(
                        radius: 18,
                        backgroundColor:
                            isSelected
                                ? AppColors.primaryColor
                                : Colors.grey.shade300,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                  onStepReached: (index) {
                    setState(() => activeStep = index);
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (activeStep == 0) {
                          activeStep = 1;
                          buttonText = 'Submit CPO';
                        } else if (activeStep == 1) {
                          activeStep = 2;
                          buttonText = 'Finished';
                        } else if (activeStep == 2) {
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
                                  'Verfication Requested',
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
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).pop(); // Close the dialog
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
                        }
                      });
                    },
                    child: Text(
                      buttonText,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
