import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sempl_test_pr/regis_screens/adress_info.dart';
import 'package:sempl_test_pr/regis_screens/person_info.dart';
import 'package:sempl_test_pr/regis_screens/third_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  final _controller = PageController();

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Add listener to update page index
    _controller.addListener(() {
      int next = _controller.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // String get stepText => 'шаг ${_currentPage + 1} из ${_pages.length}';

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      PersonInfo(pageController: _controller),
      AdressInfoScreen(pageController: _controller),
      ThirdScreen(),
      ThirdScreen(),
      ThirdScreen(),
      // ... any other pages
    ];
    String stepTexts = 'шаг ${_currentPage + 1} из ${_pages.length}';
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
        appBar: AppBar(
          toolbarHeight: 100,
          title: Column(
            children: [
              SvgPicture.asset('assets/svg/logo.svg', fit: BoxFit.cover),
              const SizedBox(height: 25),
            ],
          ),
          leading: IconButton(
            icon: SvgPicture.asset('assets/svg/arrow.svg'),
            onPressed: () {},
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            SmoothPageIndicator(
              controller: _controller,
              count: _pages.length,
              effect: WormEffect(
                activeDotColor: const Color.fromRGBO(153, 191, 212, 1),
                dotColor: const Color.fromRGBO(227, 227, 227, 1),
                dotHeight: 6,
                dotWidth: 24,
                spacing: 2.25,
              ),
              onDotClicked: (index) => _controller.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              stepTexts,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: null, // This will use the default font family
                  ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _pages[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
