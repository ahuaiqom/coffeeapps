import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<String> icons = [
    'assets/icon/HomeIcon.png',
    'assets/icon/FavoriteIcon.png',
    'assets/icon/ShopIcon.png',
    'assets/icon/NotifIcon.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          icons.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() => _selectedIndex = index);
            },
            child: _NavItem(
              iconPath: icons[index],
              active: _selectedIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String iconPath;
  final bool active;

  const _NavItem({
    required this.iconPath,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFB86E49) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        iconPath,
        height: 28,
        width: 28,
        color: active ? Colors.white : Colors.grey.shade500,
      ),
    );
  }
}
