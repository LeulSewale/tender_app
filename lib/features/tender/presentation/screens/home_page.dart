import 'package:flutter/material.dart';
import 'package:tender_app/core/constatnts/constants.dart/colors.dart';
import 'package:tender_app/features/tender/presentation/screens/menu_screen.dart';
import 'package:tender_app/features/tender/presentation/widgets/tender_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showFilter = false;

  // Categories
  final List<String> categories = ['Electronics', 'Furniture', 'Construction'];
  Set<String> selectedCategories = {};

  // Date Range
  DateTime? fromDate;
  DateTime? toDate;

  // CPO selection
  String? cpo; // 'Yes', 'No', or null

  Future<void> pickFromDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        fromDate = date;
        // If toDate is before fromDate, reset toDate
        if (toDate != null && toDate!.isBefore(fromDate!)) {
          toDate = null;
        }
      });
    }
  }

  Future<void> pickToDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: toDate ?? (fromDate ?? DateTime.now()),
      firstDate: fromDate ?? DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        toDate = date;
      });
    }
  }

  void applyFilter() {
    setState(() {
      showFilter = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuScreen(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CircleAvatar(
                  backgroundColor: AppColors.secondaryColor,
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: CircleAvatar(
              backgroundColor: AppColors.secondaryColor,
              child: IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search + Filter Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                !showFilter
                    ? Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Tender',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
                SizedBox(width: 10),
                Material(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  child: IconButton(
                    icon: Icon(Icons.filter_alt_outlined, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        showFilter = !showFilter;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                showFilter
                    ? Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DMSans',
                      ),
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Conditional: Show filter UI or TenderCard list
          Expanded(
            child:
                showFilter
                    ? SingleChildScrollView(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Categories Row
                          Text(
                            'Select Categories:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DMSans',
                            ),
                          ),
                          SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children:
                                categories.map((category) {
                                  final selected = selectedCategories.contains(
                                    category,
                                  );
                                  return ChoiceChip(
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          category,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'DMSans',
                                          ),
                                        ),
                                        if (selected)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                            ),
                                            child: Icon(
                                              Icons.check_circle,
                                              color: AppColors.primaryColor,
                                              size: 18,
                                            ),
                                          ),
                                      ],
                                    ),
                                    selected: selected,
                                    backgroundColor: AppColors.secondaryColor,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color:
                                            selected
                                                ? AppColors.primaryColor
                                                : Colors.grey.shade400,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    onSelected: (bool selectedNow) {
                                      setState(() {
                                        if (selectedNow) {
                                          selectedCategories.add(category);
                                        } else {
                                          selectedCategories.remove(category);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                          ),

                          SizedBox(height: 24),

                          // Date range picker row
                          Text(
                            'Select Date Range:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DMSans',
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: pickFromDate,
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color:
                                          fromDate != null
                                              ? AppColors.primaryColor
                                              : Colors.grey.shade400,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        fromDate == null
                                            ? 'From Date'
                                            : "${fromDate!.toLocal()}".split(
                                              ' ',
                                            )[0],
                                        style: TextStyle(
                                          color:
                                              fromDate != null
                                                  ? AppColors.primaryColor
                                                  : null,
                                          fontFamily: 'DMSans',
                                        ),
                                      ),
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color:
                                            fromDate != null
                                                ? AppColors.primaryColor
                                                : Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed:
                                      fromDate == null ? null : pickToDate,
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color:
                                          toDate != null
                                              ? AppColors.primaryColor
                                              : Colors.grey.shade400,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        toDate == null
                                            ? 'To Date'
                                            : "${toDate!.toLocal()}".split(
                                              ' ',
                                            )[0],
                                        style: TextStyle(
                                          color:
                                              toDate != null
                                                  ? AppColors.primaryColor
                                                  : null,
                                          fontFamily: 'DMSans',
                                        ),
                                      ),
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color:
                                            toDate != null
                                                ? AppColors.primaryColor
                                                : Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 24),

                          // CPO row
                          Text(
                            'CPO Include',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'DMSans',
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              ChoiceChip(
                                label: Text('Yes'),
                                selected: cpo == 'Yes',
                                onSelected: (selected) {
                                  setState(() {
                                    cpo = selected ? 'Yes' : null;
                                  });
                                },
                              ),
                              SizedBox(width: 15),
                              ChoiceChip(
                                label: Text('No'),
                                selected: cpo == 'No',
                                onSelected: (selected) {
                                  setState(() {
                                    cpo = selected ? 'No' : null;
                                  });
                                },
                              ),
                            ],
                          ),

                          SizedBox(height: 32),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  showFilter = !showFilter;
                                });
                              },
                              // applyFilter,
                              child: Text(
                                'Apply Filter',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      itemCount: 2,
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        return TenderCard();
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
