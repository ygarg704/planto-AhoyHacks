import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:planto/Model/diseaseProvider.dart';
import 'package:planto/widgets/test_Screenrecent.dart';

class RecentCarousel extends StatelessWidget {
  const RecentCarousel({
    Key key,
    @required this.diseaseData,
  }) : super(key: key);

  final Disease diseaseData;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: CarouselSlider.builder(
          itemCount: diseaseData.diseases.length,
          itemBuilder: (BuildContext context, int i, int pageViewIndex) {
            return Center(
              child: TestRecent(diseaseData.diseases[i].name),
            );
          },
          options:
              CarouselOptions(height: MediaQuery.of(context).size.height * 0.2),
        )
        //Image.asset('logo.png'),
        );
  }
}
