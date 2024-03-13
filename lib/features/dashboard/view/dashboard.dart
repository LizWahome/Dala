import 'package:delivery_app/common/extension/theme_colors.dart';
import 'package:delivery_app/features/dashboard/home/home.dart';
import 'package:delivery_app/features/dashboard/view/cart/cart.dart';
import 'package:delivery_app/features/dashboard/view/discover/discover.dart';
import 'package:delivery_app/features/dashboard/view/homepage/homepage.dart';
import 'package:delivery_app/features/dashboard/view/profile/profile.dart';
import 'package:delivery_app/features/dashboard/view/search/search.dart';
import 'package:delivery_app/features/dashboard/view/track_order/track_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CupertinoBottomSection extends StatelessWidget {
  const CupertinoBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: context.cardColor,
        inactiveColor: context.tertially,
        backgroundColor: context.primary,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home,),
        ),
        BottomNavigationBarItem( 
          label: "Track Order",
          icon: Icon(Icons.gps_not_fixed_rounded,),
        ),
        // BottomNavigationBarItem(
        //   label: "Search",
        //   icon: Icon(Icons.search),
        // ),
        // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        // BottomNavigationBarItem(
        //   label: "Profile",
        //   icon: Icon(Icons.person),
        // ),
      ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(child: HomeScreen());
              },
            );
            case 1:
            return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(child: TrackOrder());
              },
            );
            // case 2:
            // return CupertinoTabView(
            //   builder: (context) {
            //     return const CupertinoPageScaffold(child: SearchPage());
            //   },
            // );
            // case 3:
            // return CupertinoTabView(
            //   builder: (context) {
            //     return const CupertinoPageScaffold(child: CartPage());
            //   },
            // );
            // case 4:
            // return CupertinoTabView(
            //   builder: (context) {
            //     return const CupertinoPageScaffold(child: ProfilePage());
            //   },
            // );
            default: return CupertinoTabView(
              builder: (context) {
                return const CupertinoPageScaffold(child: HomeScreen());
              },
            );
        }
      },
    );
  }
}

// class DashBoardPage extends ConsumerStatefulWidget {
//   const DashBoardPage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DashBoardPageState();
// }

// class _DashBoardPageState extends ConsumerState<DashBoardPage> {
//   final List<Widget> _pages = [
//     const HomePage(),
//     const DiscoverPage(),
//     const SearchPage(),
//     const CartPage(),
//     const ProfilePage()
//   ];
//   final pageProvider = StateProvider<int>((ref) => 0);
//   @override
//   Widget build(BuildContext context) {
//     final currentIndex = ref.watch(pageProvider);
//     return Scaffold(
//       body: _pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: context.secondary,
//         type: BottomNavigationBarType.fixed,
//         showUnselectedLabels: true,
//         unselectedItemColor: context.tertially,
//         currentIndex: currentIndex,
//         onTap: (value) {
//           ref.read(pageProvider.notifier).state = value;
//         },
//         items: const [
//           BottomNavigationBarItem(
//             label: "Home",
//             icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             label: "Discover",
//             icon: Icon(Icons.explore),
//           ),
//           BottomNavigationBarItem(
//             label: "Search",
//             icon: Icon(Icons.search),
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart), label: "Cart"),
//           BottomNavigationBarItem(
//             label: "Profile",
//             icon: Icon(Icons.person),
//           ),
//         ],
//       ),
//     );
//   }
// }
