//
// import 'package:flashcardquiz/features/question/presentation/page/question_view/question_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../question/presentation/bloc/question_bloc.dart';
// import '../bloc/bottom_navbar_bloc.dart';
//
// class BottomNavbar extends StatefulWidget {
//   const BottomNavbar({super.key});
//
//   @override
//   State<BottomNavbar> createState() => _BottomNavbarState();
// }
//
// class _BottomNavbarState extends State<BottomNavbar> {
//
//
//
//   final PageController _pageController = PageController(viewportFraction: 1.0);
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     context.read<QuestionBloc>().add(GetQuestionsEvent());
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<BottomNavbarBloc, BottomNavBarState>(
//         builder: (context, state) {
//           final screens = [
//             QuestionView(),
//             CategoryScreen(),
//             CartScreen(),
//             ProfileScreen(),
//           ];
//           return screens[state.index];
//         },
//       ),
//       bottomNavigationBar: BlocBuilder<BottomNavbarBloc, BottomNavBarState>(
//         builder: (context, state) {
//           return BottomNavigationBar(
//             currentIndex: state.index,
//             onTap: (index) => context.read<BottomNavbarBloc>().add(NavBarItemTapped(index)),
//             selectedItemColor: Colors.red,
//             unselectedItemColor: Colors.grey,
//             items: [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//               BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
//               BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
//               BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
//
// // Screens
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Home Screen'));
//   }
// }
//
// class CategoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Category Screen'));
//   }
// }
//
// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Cart Screen'));
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Profile Screen'));
//   }
// }


import 'package:flashcardquiz/features/question/presentation/page/question_view/question_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../leaderboard/presentation/page/leader_board_view.dart';
import '../../../question/presentation/bloc/question_bloc.dart';
import '../bloc/bottom_navbar_bloc.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {



  // @override
  // void initState() {
  //   super.initState();
  //   context.read<QuestionBloc>().add(GetQuestionsEvent());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarBloc, BottomNavBarState>(
      builder: (context, state) {
        final screens = [
          QuestionView(),
          CategoryScreen(),
          LeaderBoardView(),
          ProfileScreen(),
        ];

        return Scaffold(
          body: screens[state.index], // ✅ Bloc অনুযায়ী স্ক্রিন আপডেট হবে
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) => context.read<BottomNavbarBloc>().add(NavBarItemTapped(index)), // ✅ Event ঠিকমতো পাঠানো হচ্ছে
            selectedItemColor: Color(0xff12CBC4),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: 'Community'),
              BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Screen'));
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Category Screen'));
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cart Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Screen'));
  }
}