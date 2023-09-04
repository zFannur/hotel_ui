import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:job_test/core/config/app_config.dart';

class CarouselWidget extends StatefulWidget {
  final List<String> imagesUrl;

  const CarouselWidget({super.key, required this.imagesUrl});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWidgetState();
  }
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
            onSlideChanged: (value) {
              String str = value.toString();
              activePage = int.parse(str[str.length-1]);
              setState(() {});
            },
            slideBuilder: (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15 * fem),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.imagesUrl[index],
                    ),
                  ),
                ),
              );
            },
            slideTransform: const CubeTransform(),
            itemCount: widget.imagesUrl.length),
        FittedBox(
          child: Container(
            padding: EdgeInsets.fromLTRB(6 * fem, 2 * fem, 6 * fem, 2 * fem),
            margin: EdgeInsets.fromLTRB(134 * fem, 232 * fem, 134 * fem, 8 * fem),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(5 * fem),
            ),
            child: Row(
              children: indicators(widget.imagesUrl.length, activePage),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> indicators(imagesLength,currentIndex) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;

    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        width: 7 * fem,
        height: 7 * fem,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }
}
