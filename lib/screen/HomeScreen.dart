import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_random_number_generator/constant/Color.dart';
import 'package:flutter_random_number_generator/screen/Settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          //padding: EdgeInsets.all(16.0),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0, //가로
            //vertical: 8.0,  //세로
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ==> 가로 왼쪽 정렬
            children: [
              _Header(),
              _Body(
                randomNumbers: randomNumbers,
              ),
              _Footer(
                onPressed: onRandomNunmberGenerate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onRandomNunmberGenerate() {
    final rand = Random();
    print(rand.nextInt(1000)); // ==> 최대 1000까지의 랜덤값 생성
    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = rand.nextInt(1000);
      newNumbers.add(number);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext conext){
                return SettingsScreen();
              }),
            );
          },
          icon: Icon(
            Icons.settings,
            color: RED_COLOR,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .asMap()
              .entries // ==> key와 value로 반환해줌
              .map(
                (x) => Padding(
                  padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16.0),
                  child: Row(
                    children: x.value
                        .toString()
                        .split('')
                        .map((y) => Image.asset(
                              'asset/img/$y.png',
                              height: 70,
                              width: 50,
                            ))
                        .toList(),
                  ),
                ),
              )
              .toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ==> 간단하게 넓이랑 폭만 정할 수 있다. Container 위젯을 사용할 수 있지만 위젯 명칭에 뉘양스 때문에 SizeBox를 사용한다.
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: RED_COLOR,
        ),
        onPressed: onPressed,
        child: Text('생성하기'),
      ),
    );
  }
}
