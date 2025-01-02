import 'package:flutter/material.dart';
import 'package:maggood/viewmodels/providers/layout_provider.dart';
import 'package:maggood/views/screens/artikel_screen.dart';
import 'package:maggood/views/screens/dashboard_screen.dart';
import 'package:maggood/views/screens/jadwal_screen.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    const pages = [
      JadwalScreen(),
      DashboardScreen(),
      ArtikelScreen(),
    ];

    return Consumer<LayoutProvider>(builder: (context, state, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green[500],
          currentIndex: state.activeIdx,
          onTap: (value) {
            context.read<LayoutProvider>().changeIdx(value);
          },
          items: const [
            BottomNavigationBarItem(
              label: "Jadwal",
              icon: Icon(
                Icons.calendar_month,
              ),
            ),
            BottomNavigationBarItem(
              label: "Dashboard",
              icon: Icon(
                Icons.speed,
              ),
            ),
            BottomNavigationBarItem(
              label: "Artikel",
              icon: Icon(
                Icons.menu_book_rounded,
              ),
            ),
          ],
        ),
        body: pages[state.activeIdx],
      );
    });
  }
}
