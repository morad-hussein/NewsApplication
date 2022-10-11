import 'package:apiapi/provider/control_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../provider/breakingnews_provider.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(
        builder:(context,provider,child){
          return  Scaffold(
            body: provider.CurrentScreen,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.pink[300]!,
                    hoverColor: Colors.pink[300]!,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.pink[300]!,
                    color: Colors.white,
                    tabs: [

                      GButton(
                        icon: LineIcons.newspaper,
                        text: 'Newspaper',
                      ),
                      GButton(
                        icon: Icons.sports,
                        text: 'Sports',
                      ),
                      GButton(
                        icon: LineIcons.search,
                        text: 'Search',
                      ),
                    ],
                    selectedIndex: provider.currentIndex,
                    onTabChange: (index) {
                      provider.changeScreen(index);
                    },
                  ),
                ),
              ),
            ),
          );
        }
    );

  }
}
