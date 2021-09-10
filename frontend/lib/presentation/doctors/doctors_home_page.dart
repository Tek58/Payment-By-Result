import 'package:flutter/material.dart';
import 'package:frontend/presentation/colors.dart';
import 'package:frontend/presentation/core/widgets/action_bar.dart';
import 'package:frontend/presentation/core/home_page.dart';
import 'package:frontend/presentation/core/widgets/tab_view.dart';
import 'package:frontend/presentation/doctors/widgets/patients_list_view.dart';
import 'package:frontend/presentation/doctors/widgets/records_list_view.dart';

class DoctorsHomePage extends StatelessWidget {
  const DoctorsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: HomePage(
          tabView: TabView(
            length: 2,
            key: Key("tabview"),
            tabBarView:
                TabBarView(children: [PatientsListView(key: Key("myPaitents"),), RecordsListView(key: Key("recents"),)]),
            tabs: ['My patients', 'Recents'],
            headerText: 'Home',
            actionBar: ActionBar(
              trailingIcon: Icons.search_sharp,
              onTrailingPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}