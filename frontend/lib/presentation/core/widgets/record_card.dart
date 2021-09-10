import 'package:flutter/material.dart';
import 'package:frontend/presentation/core/build_info_row.dart';

import '../../colors.dart';

class RecordCard extends StatelessWidget {
  const RecordCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        key: Key("recentUser"),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInfoRow(
                      title: 'Patient', value: 'Mohammed Abfulqadirrr'),
                  Text(
                    '9-12-2021',
                    style: TextStyle(
                      color: GREY_COLOR,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInfoRow(title: 'by', value: 'Dr Sun'),
                  buildInfoRow(title: 'cost', value: '\$1523'),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '5 total procedures performed',
                style: TextStyle(
                  color: GREY_COLOR,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
