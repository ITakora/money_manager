import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/screens/history_screen.dart';
import 'package:money_manager/screens/home_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Money Manager',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: PersistentTabView(
          tabs: [
            PersistentTabConfig(
              screen: HomeScreen(),
              item: ItemConfig(
                textStyle: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w600),
                activeForegroundColor: Colors.black,
                icon: Icon(Icons.home),
                title: "Home",
              ),
            ),
            PersistentTabConfig(
              screen: HistoryScreen(),
              item: ItemConfig(
                textStyle: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.bold),
                activeForegroundColor: Colors.black,
                icon: Icon(Icons.history),
                title: "History",
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style7BottomNavBar(
              navBarDecoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFFEFEFE),
              ),
              navBarConfig: navBarConfig),
        ));
  }
}
