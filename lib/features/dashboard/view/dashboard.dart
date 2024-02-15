import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/features/dashboard/view/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoardPage extends ConsumerStatefulWidget {
  const DashBoardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends ConsumerState<DashBoardPage> {
  final List<Widget> _pages = [
    const HomePage(),
    const Text("Discover"),
    const Text("Search"),
    const Text("Profile")
  ];
  final pageProvider = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(pageProvider);
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.secondary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: context.tertially,
        currentIndex: currentIndex,
        onTap: (value) {
          ref.read(pageProvider.notifier).state = value;
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Discover",
            icon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
