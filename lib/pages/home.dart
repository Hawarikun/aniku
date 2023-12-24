import 'package:aniku/common/style.dart';
import 'package:aniku/pages/home_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
final pageControllerProvider =
    StateProvider.autoDispose<PageController>((ref) => PageController());

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final pageController = ref.watch(pageControllerProvider);
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeFragment(),
          Center(
            child: Text("setting"),
          ),
          Center(
            child: Text("search"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          ref.read(pageControllerProvider).jumpToPage(value);
          ref.read(currentIndexProvider.notifier).state = value;
        },
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: ColorApp.primary,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: "MyList",
            icon: Icon(Icons.bookmark_border_rounded),
          ),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
