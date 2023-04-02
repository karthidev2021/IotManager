import 'package:flutter/material.dart';
import 'pages/home.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  late Size size;
  List<List> menu = [
    ["Home", Icons.home],
    ["Profile", Icons.settings],
  ];
  int selectedMenu = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          NavBar(),
          Flexible(
            child: PageNavigator(),
          ),
        ],
      ),
    );
  }

  Widget PageNavigator() {
    if (selectedMenu == 0) {
      return HomePage();
    } else {
      return Container();
    }
  }

  Widget NavBar() {
    late bool isSelected;

    return Container(
      width: (isExpanded) ? 200 : 80,
      height: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        IconButton(
            alignment: Alignment.centerRight,
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            icon: Icon(Icons.menu)),
        SizedBox(
          width: double.infinity,
          height: size.height * 0.20,
          child: CircleAvatar(
            child: Icon(Icons.face),
          ),
        ),
        isExpanded ? Text("Name") : Container(),
        SizedBox(height: size.height * 0.01),
        Container(
          height: size.height * 0.5,
          width: double.maxFinite,
          child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, menuIndex) {
                isSelected = (selectedMenu == menuIndex);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMenu = menuIndex;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        isSelected
                            ? BoxShadow(color: Colors.black, blurRadius: 1)
                            : BoxShadow(
                                color: Colors.transparent,
                                blurRadius: 0,
                              ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: (isSelected) ? Colors.grey : Colors.transparent,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          menu[menuIndex][1],
                          color: (isSelected) ? Colors.white : Colors.black,
                        ),
                        isExpanded
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  menu[menuIndex][0],
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
