import 'package:flutter/material.dart';

class MonthsList extends StatelessWidget {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  MonthsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: months.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.06),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.01),
              color: Colors.black12,
            ),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  months[index],
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
