import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/presentation/pages/account_screen.dart';
import 'package:dgtix_app/presentation/pages/history_screen.dart';
import 'package:dgtix_app/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationPage extends StatefulWidget {
  int? index;
  BottomNavigationPage({
    this.index,
  });
  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  List<Widget> _pages = [
    HomeScreen(),
    HistoryScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: Row(
        children: [
          NavBarItem(
            index: 0,
            icons: 'assets/icons/home.svg',
            isSelected: _selectedIndex == 0,
            onTap: () => _onItemTapped(0),
          ),
          NavBarItem(
            index: 1,
            icons: 'assets/icons/history.svg',
            isSelected: _selectedIndex == 1,
            onTap: () => _onItemTapped(1),
          ),
          NavBarItem(
            index: 2,
            icons: 'assets/icons/account.svg',
            isSelected: _selectedIndex == 2,
            onTap: () => _onItemTapped(2),
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final int index;
  final String icons;
  final bool isSelected;
  final void Function() onTap;

  const NavBarItem({
    super.key,
    required this.index,
    required this.icons,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          color: AppColor.primaryColorBottomNavBar,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icons,
                color: (isSelected) ? AppColor.secondaryColor : null,
              ),
              SizedBox(height: 8),
              Container(
                color: (isSelected) ? AppColor.orangeColor : null,
                height: 2,
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
