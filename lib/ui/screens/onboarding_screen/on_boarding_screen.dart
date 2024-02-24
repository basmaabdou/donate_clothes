import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/basic.dart';
import '../users/login_screen.dart';
import 'on_boarding_two.dart';

class BoardingModel {
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String body;
  final String title;

  BoardingModel({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.body,
    required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image1: 'assets/images/o7.jpg',
        image2: 'assets/images/o5.jpg',
        image3: 'assets/images/o6.jpg',
        image4: 'assets/images/o8.jpg',
        title: 'Let’s Help \n Each Others',
        body: 'when we give cheerfully and accept gratefully everyone is blessed'),
    BoardingModel(
        image1: 'assets/images/o1.jpg',
        image2: 'assets/images/o2.jpg',
        image3: 'assets/images/o3.jpg',
        image4: 'assets/images/o4.jpg',
        title: 'Many Need\n People Needy\n Donations',
        body: 'when we give cheerfully and accept gratefully everyone is blessed'
    ),
  ];



  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
               navigateTo(context, LoginScreen());
            },
            child: const Text('skip  ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffF74F22))),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15,top: 15,end: 15,bottom: 40),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SmoothPageIndicator(
              controller: boardController,
              count: boarding.length,
              effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Color(0xffF74F22),
                  dotHeight: 7,
                  dotWidth: 10,
                  spacing: 5,
                  expansionFactor: 4),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              // width: 45,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   border: Border.all(color: defaultColor)
              // ),
              child: FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context)=>OnBoardingScreenTwo()),
                            (route) => false
                    );
                  }
                  boardController.nextPage(
                      duration: Duration(milliseconds: 50),
                      curve: Curves.fastEaseInToSlowEaseOut
                  );
                },
                child: Icon(Icons.arrow_forward_ios, size: 20),
                backgroundColor: Color(0xffF74F22),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Row(
            children: [
              Container(
                height: 160,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('${model.image1}'),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(75),
                        topStart: Radius.circular(75)
                    ),
                    image: DecorationImage(
                      image: AssetImage('${model.image2}'),
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(75),topStart: Radius.circular(75)),
                    image: DecorationImage(
                      image: AssetImage('${model.image3}'),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 160,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                     image: DecorationImage(
                      image: AssetImage('${model.image4}'),
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Color(0xff000000)
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.body}',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
}
