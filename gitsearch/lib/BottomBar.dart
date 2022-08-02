import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(8),
      height: size.width * .125,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Color(0xFFF2EA06),
        ),
        color: Color(0xD718223C),
        boxShadow: [
          BoxShadow(
            color: Color(0x73000000).withOpacity(.15),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                splashColor: Colors.transparent,
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == currentIndex ? 0 : size.width * .029,
                        right: size.width * .0422,
                        left: size.width * .0422,
                      ),
                      width: size.width * .23,
                      height: index == currentIndex ? size.width * .014 : 0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 222, 227, 236),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.home,
                      size: size.width * .076,
                      color: index == currentIndex
                          ? Color(0xFFE7D90B)
                          : Color(0xF8FDFCFC),
                    ),
                  ],
                ),
              )),
    );
  }
}
