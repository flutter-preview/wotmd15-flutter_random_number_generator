import 'package:flutter/material.dart';
import 'package:flutter_random_number_generator/constant/Color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              Row(
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: RED_COLOR,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      123,
                      456,
                      789,
                    ]
                        .map(
                          (x) => Row(
                            children: x
                                .toString()
                                .split('')
                                .map((y) => Image.asset(
                                      'asset/img/$y.png',
                                      height: 70,
                                      width: 50,
                                    ))
                                .toList(),
                          ),
                        )
                        .toList()),
              ),
              SizedBox(
                // ==> 간단하게 넓이랑 폭만 정할 수 있다. Container 위젯을 사용할 수 있지만 위젯 명칭에 뉘양스 때문에 SizeBox를 사용한다.
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: RED_COLOR,
                  ),
                  onPressed: () {},
                  child: Text('생성하기'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
