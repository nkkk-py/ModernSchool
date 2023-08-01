import 'dart:async';

import 'package:flutter/material.dart';

// class CarouselSplash extends StatelessWidget {
//   const CarouselSplash({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 400,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 3),
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         enlargeFactor: 0.3,
//         scrollDirection: Axis.horizontal,
//       ),
//       items: [1, 2, 3, 4, 5].map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: const BoxDecoration(color: Colors.amber),
//                 child: Text(
//                   'text $i',
//                   style: const TextStyle(fontSize: 16.0),
//                 ));
//           },
//         );
//       }).toList(),
//     );
//   }
// }

// class CarouselSplash extends StatelessWidget {
//   CarouselSplash({super.key});
//   CarouselController buttonCarouselController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) => Column(
//         children: <Widget>[
//           CarouselSlider(
//             items: [1, 2, 3].map((i) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                       decoration: const BoxDecoration(color: Colors.amber),
//                       child: Text(
//                         'text $i',
//                         style: const TextStyle(fontSize: 16.0),
//                       ));
//                 },
//               );
//             }).toList(),
//             carouselController: buttonCarouselController,
//             options: CarouselOptions(
//               viewportFraction: 0.9,
//               aspectRatio: 2.0,
//               initialPage: 2,
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 3),
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enlargeCenterPage: true,
//               enlargeFactor: 0.3,
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () => buttonCarouselController.nextPage(
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.linear),
//             child: const Text('→'),
//           )
//         ],
//       );
// }

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> _images = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
  ];

  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // *************************************************
  // final PageController controller = PageController(initialPage: 0);
  // int currentPage = 0;
  // Timer timer;

  // @override
  // void initState() {
  //   super.initState();
  //   timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
  //     if (currentPage < 2) {
  //       currentPage++;
  //     } else {
  //       currentPage = 0;
  //     }
  //     controller.animateToPage(
  //       currentPage,
  //       duration: Duration(milliseconds: 350),
  //       curve: Curves.easeIn,
  //     );
  //   });
  // }

  // ************************************************

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              return CircleAvatar(
                backgroundImage: NetworkImage(_images[index]),
                radius: 50,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _images.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 5,
                backgroundColor:
                    _currentPage == index ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
