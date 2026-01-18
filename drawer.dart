import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // ===== Header =====
          DrawerHeader(
            decoration:  BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.note, size: 30, color: Colors.blue),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "تطبيق الملاحظات",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "نظم أفكارك بسهولة",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                )
              ],
            ),
          ),

          // ===== Items =====
          _drawerItem(
            icon: Icons.notes,
            title: "الملاحظات",
            onTap: () {},
          ),
          _drawerItem(
            icon: Icons.star_border,
            title: "المفضلة",
            onTap: () {},
          ),
          _drawerItem(
            icon: Icons.delete_outline,
            title: "المحذوفة",
            onTap: () {},
          ),

          const Divider(),

          _drawerItem(
            icon: Icons.settings,
            title: "الإعدادات",
            onTap: () {},
          ),
          _drawerItem(
            icon: Icons.info_outline,
            title: "عن التطبيق",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // عنصر موحد
  static Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}