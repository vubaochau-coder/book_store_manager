import 'package:gap/gap.dart';
import 'views/home_cell.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'views/home_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(MdiIcons.bell),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(MdiIcons.facebookMessenger),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chào buổi sáng',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade400,
                ),
              ),
              Row(
                children: [
                  Expanded(child: HomeCell()),
                  Gap(10),
                  Expanded(child: HomeCell()),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(child: HomeCell()),
                  Gap(10),
                  Expanded(child: HomeCell()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
