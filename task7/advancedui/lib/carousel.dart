
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

class DestinationCarousel extends StatefulWidget{

  const DestinationCarousel({required key}) : super(key: key);

  @override
  _DestinationCarouselState createState()=>_DestinationCarouselState();


}

class _DestinationCarouselState extends State<DestinationCarousel>{
  

  int _current=0;

  final List<String> images =[
    'assets/images/Asia.jpg',
    'assets/images/Africa.jpg',
    'assets/images/Europe.jpg',
    'assets/images/SouthAmerica.jpg',
    'assets/images/Australia.jpg',
    'assets/images/Antarctica.jpg',
  ];

  final List<String> places=[
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',


  ];

  List<Widget> generateImageFiles(){
    return images.map((element) => ClipRRect(
      child:Image.asset(element,
      fit: BoxFit.cover,),
      borderRadius: BorderRadius.circular(15.0),

    )).toList();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      color: Color.fromARGB(255, 101, 166, 155),
      padding: const EdgeInsets.only(top:50),
      child: Stack(
        children: [
          CarouselSlider(items: generateImageFiles(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 25/15,
            onPageChanged: (index,other){
              setState(() {
                _current=index;
              });
            }
          )),
          AspectRatio(aspectRatio: 40/20,
          child: Center(child: 
          Text(
            places[_current],
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize:MediaQuery.of(context).size.width/13
            ),
          ),),)
        ],
      ),
    );
  }}