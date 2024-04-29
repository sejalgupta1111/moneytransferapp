import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/bottom/statement_screen.dart';
import 'package:mollet/registration/log_in_screen.dart';

import '../helper/constant.dart';
import 'add_screen.dart';
import 'home_screen.dart';


class BottomScreen extends StatefulWidget {
  String amt="";
  String phone="";
  BottomScreen({required this.amt,required this.phone});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {





  int _totalNotifications = 10;

  int selectedIndex = 0;

  // List<Widget> _children = [
  //   HomeScreen(),
  //   BagScreen(),
  //   MyTaskScreen(),
  //   ChatListScreen(),
  //   HoldPayment()
  // ];

  PageController? _pageController;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();






  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // cart.getCartCount();


  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false, // fluter 2.x
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => selectedIndex = index);
            },
            children: <Widget>[
              HomeScreen(amt: widget.amt,phone: widget.phone),
              StatementScreen(phone: widget.phone),
              AddScreen(),
            ]),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ),
              color:AppColor.secondaryColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    setState(() {
                      onItemTapped(0);
                    });
                  },

                  child:
                  // selectedIndex == 0?
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       height: 45,width: 45,
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(image:
                  //         AssetImage(ProjectImage.light,),
                  //           fit: BoxFit.fill,),
                  //       ),
                  //       // decoration: BoxDecoration(
                  //       //     shape: BoxShape.circle,
                  //       //     color: Color(0xFF7892f8)
                  //       // ),
                  //       child:
                  //       Padding(
                  //         padding:  EdgeInsets.all(8.0),
                  //         child: Image.asset(ProjectImage.home,
                  //           height: 30,width: 30,fit: BoxFit.fill,
                  //         ),
                  //       ),
                  //     ),
                  //     // SizedBox(height: 5,),
                  //     // Text("Home",
                  //     //   style: GoogleFonts.poppins(
                  //     //       color: Color(0xFFFFFFFF),
                  //     //       fontWeight: FontWeight.w500,
                  //     //       fontSize: 10
                  //     //   ),
                  //     // )
                  //   ],
                  // )
                  //     :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 45,width: 45,
                      //   // decoration: BoxDecoration(
                      //   //     shape: BoxShape.circle,
                      //   //     color:Colors.transparent
                      //   // ),
                      //   child: Padding(
                      //     padding:  EdgeInsets.all(8.0),
                      //     child: Image.asset(ProjectImage.home,
                      //       height: 30,width: 30,fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 5,),
                      Text("Forex",
                        style: GoogleFonts.poppins(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      )
                    ],
                  )
              ),
              Container(
                height: 60,width: 10,
                child: VerticalDivider(
                    color:Colors.white,
                  width: 2,
                  thickness: 2,
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      onItemTapped(1);
                    });
                  },
                  child:
                  // selectedIndex == 1?
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       height: 45,width: 45,
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(image:
                  //         AssetImage(ProjectImage.light,),
                  //           fit: BoxFit.fill,),
                  //       ),
                  //       child:
                  //       Padding(
                  //         padding:  EdgeInsets.all(10.0),
                  //         child: Image.asset(ProjectImage.portfolio,
                  //           height: 30,width: 30,
                  //         ),
                  //       ),
                  //     ),
                  //     // SizedBox(height: 5,),
                  //     // Text("Home",
                  //     //   style: GoogleFonts.poppins(
                  //     //       color: Color(0xFFFFFFFF),
                  //     //       fontWeight: FontWeight.w500,
                  //     //       fontSize: 10
                  //     //   ),
                  //     // )
                  //   ],
                  // )
                  //     :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 45,width: 45,
                      //   // decoration: BoxDecoration(
                      //   //     shape: BoxShape.circle,
                      //   //     color: Colors.transparent
                      //   // ),
                      //   child: Padding(
                      //     padding:  EdgeInsets.all(10.0),
                      //     child: Image.asset(ProjectImage.portfolio,
                      //       height: 30,width: 30,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 5,),
                      Text("Statement",
                        style: GoogleFonts.poppins(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      )
                    ],
                  )
              ),
              Container(
                height: 60,width: 10,
                child: VerticalDivider(
                  color:Colors.white,
                  width: 2,
                  thickness: 2,
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      onItemTapped(2);
                    });
                  },
                  child:
                  // selectedIndex == 2?
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     // Container(
                  //     //   height: 45,width: 45,
                  //     //   decoration: BoxDecoration(
                  //     //     image: DecorationImage(image:
                  //     //     AssetImage(ProjectImage.light,),
                  //     //       fit: BoxFit.fill,),
                  //     //   ),
                  //     //   child: Padding(
                  //     //     padding:  EdgeInsets.all(8.0),
                  //     //     child: Image.asset(ProjectImage.completed,
                  //     //       height: 30,width: 30,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     // SizedBox(height: 5,),
                  //     Text("Add",
                  //       style: GoogleFonts.poppins(
                  //           color: Color(0xFFFFFFFF),
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 10
                  //       ),
                  //     )
                  //   ],
                  // )
                  //     :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 45,width: 45,
                      //   // decoration: BoxDecoration(
                      //   //     shape: BoxShape.circle,
                      //   //     color: Colors.transparent
                      //   // ),
                      //   child:
                      //   Padding(
                      //     padding:  EdgeInsets.all(8.0),
                      //     child: Image.asset(ProjectImage.completed,
                      //       height: 30,width: 30,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 5,),
                      Text("Add",
                        style: GoogleFonts.poppins(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      )
                    ],
                  )
              ),

            ],
          ),

        ),
      );
  }



  void onItemTapped(int value) {

    setState(() {
      selectedIndex = value;

      // _pageController!.animateToPage(value,
      //     duration: Duration(milliseconds: 300), curve: Curves.easeOut);

      _pageController!.jumpToPage(value);
    });
  }

}
