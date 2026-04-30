import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor/Core/helper/image_assets.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  ImageAssets.carouselSlider1,
  ImageAssets.carouselSlider2,
  ImageAssets.carouselSlider3,
];

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Widget> imageSliders = imgList
      .map(
        (item) => ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(item, height: 172, width: 340),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.11,
            onPageChanged: (index, reason) {
              setState(() => _current = index);
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withValues(alpha: _current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
