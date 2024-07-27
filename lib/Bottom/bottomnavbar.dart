import 'package:flutter/material.dart';


class CustomIcon extends StatelessWidget {

  final IconData icon;
  final Color iconcolor;
  final double iconsize;

  const CustomIcon({required this.icon, required this.iconsize, required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(50),

      ),
      padding: EdgeInsets.all(8),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconsize,
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedindex = 0;

  void onitemtapped(int index) {
    setState(() {
      selectedindex=index;
    });
    switch(index){
      case 0:
        Navigator.pushNamed(context, '/main');
        break;
      case 1:
        Navigator.pushNamed(context, '/calender');
        break;

      case 2:
        Navigator.pushNamed(context, '/addTask');
        break;

      case 3:
        Navigator.pushNamed(context, '/blogscreen');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedindex,
      onTap: onitemtapped,
      unselectedItemColor: Colors.grey,
     selectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(
        color: Colors.grey[800],
       // fill: null,
      ),


      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,

            ),
            label: ''),

        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,

            ),
            label: ''),

        BottomNavigationBarItem(
            icon: CustomIcon(
              icon: Icons.add,
              iconcolor: Colors.white,
              iconsize: 30,

            ),
          label: '',
        ),

        BottomNavigationBarItem(
            icon: Icon(
              Icons.doorbell_outlined,

            ),
            label: ''),

        BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle_outlined,
            ),
            label: ''),
      ],

    );
  }
}
