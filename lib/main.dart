import 'package:flutter/material.dart';
import 'session1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp 是整個 App 的根容器，提供導頁、主題等基礎設定。
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0D0D),
      // GestureDetector 讓整個畫面可點擊以進入下一頁。
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // 點擊後使用 Navigator 推入 Session1 頁面。
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Session1()),
          );
        },
        // Center 將內容置中顯示。
        child: const Center(
          // Column 垂直排列 Logo 與提示文字。
          child: Column(
            mainAxisSize: MainAxisSize.min,
              children: [
              // Image 顯示首頁 Logo。
              Image(
                image: AssetImage('assets/Hazbin-Hotel-Logo-2021.png'),
              ),
              // SizedBox 用來留白，拉開上下元件距離。
              SizedBox(height: 20),
              // Text 顯示操作提示。
              Text(
                'Redemption starts here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              

            ]
          )
        ),
      ),
    );
  }
}

