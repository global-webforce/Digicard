import 'package:flutter/material.dart';
import 'package:flutter_ez_core/helpers/ui_helpers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'app_logo.dart';
import 'buildin_transformers.dart';

class OnboaringItem {
  final String testimonial;
  final String personName;
  final String personTitle;
  final Color color;
  final String image;
  OnboaringItem(
      {required this.testimonial,
      required this.personName,
      required this.personTitle,
      required this.color,
      required this.image});
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  Widget appTitle() {
    return Container(
        padding: const EdgeInsets.all(30.0), child: const AppLogo());
  }

  final list = [
    OnboaringItem(
        testimonial:
            "This digital business card app is a game-changer! It's sleek, professional, and has transformed the way I network.",
        color: Colors.orange,
        image: 'assets/images/bg1.jpg',
        personName: "Hitesh Parekh",
        personTitle: "Managing Director"),
    OnboaringItem(
      testimonial:
          "I never knew a digital business card could be so impactful until I discovered this app.",
      color: Colors.red,
      image: 'assets/images/bg2.jpg',
      personName: "Jane Doe",
      personTitle: "Business Owner",
    ),
    OnboaringItem(
      testimonial:
          "This app has completely elevated my networking game. \nIt's like carrying my digital identity in my pocket.",
      color: Colors.green,
      image: 'assets/images/bg3.jpg',
      personName: "John Doe",
      personTitle: "Freelance Worker",
    )
  ];

  final controller = TransformerPageController(
    initialPage: 0,
    itemCount: 3,
    loop: true,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TransformerPageView(
          itemCount: list.length,
          pageController: controller,
          loop: true,
          viewportFraction: 0.8,
          transformer: ScaleAndFadeTransformer(),
          itemBuilder: (BuildContext context, int index) {
            final item = list[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Container(
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0, 0.8],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              /*     colorFilter: ColorFilter.mode(
                                item.color.withOpacity(0.4),
                                BlendMode.srcOver,
                              ), */
                              image: AssetImage(item.image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 80),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 800,
                                    child: Text(
                                      "\"${item.testimonial}.\"",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                      ).copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  vSpaceRegular,
                                  Text(
                                    item.personName,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ).copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(item.personTitle,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        Align(alignment: Alignment.topLeft, child: appTitle()),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: list.length,
                  effect: const WormEffect(
                    activeDotColor: Colors.white,
                    dotWidth: 10,
                    dotHeight: 10,
                  ), // your preferred effect
                  onDotClicked: (index) {})),
        )
      ],
    );
  }
}
