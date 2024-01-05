import 'package:aniku/common/style.dart';
import 'package:aniku/core/config/assets.dart';
import 'package:aniku/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final Widget body;

  const CustomAppBar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          body,
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.05, size.height * 0, size.width * 0.05, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                    child: SvgPicture.asset(logoApp),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: ColorApp.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: ColorApp.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDetailAppBar extends StatelessWidget {
  const CustomDetailAppBar({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        body,
        SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.04, size.height * 0, size.width * 0.05, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    AppRoutes.goRouter.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ColorApp.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cast_rounded,
                    color: ColorApp.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
