import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget{
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: const Color(0xFF2A1A1A),
      foregroundColor: const Color(0xFFF2F2F2),
      elevation: 12,
      shadowColor: const Color(0x40C1121F),
      centerTitle: true,
      title: Image.asset(
        'assets/Hazbin-Hotel-Logo-2021.png',
        height: 56,
        fit: BoxFit.contain,
      ),

      // flexibleSpace: SafeArea(
      //   child: Row(
      //     children: [
      //       Expanded(
      //         flex: 1,
      //         child: const SizedBox.shrink(),
      //       ),

      //       Expanded(
      //         flex: 3,
      //         child: Center(
      //           child: Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               Image.asset(
      //                 'assets/Hazbin-Hotel-Logo-2021.png',
      //                 height: 40,
      //                 fit: BoxFit.contain,
      //               ),
      //             ],
      //         ),
      //         )
      //       ),
      //       Expanded(
      //         flex: 1,
      //         child: const SizedBox.shrink(),
      //       ),
      //     ],
      //   )
      // ),
      
    );
  }

}
