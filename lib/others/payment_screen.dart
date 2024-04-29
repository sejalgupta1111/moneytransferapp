import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../helper/image.dart';
import 'authorize_pay_screen.dart';


class PaymentScreen extends StatefulWidget {

  String amount = "";
  String Number = "";

  PaymentScreen({required this.amount,required this.Number});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {


  String numberReceiver = "";


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   detailRec();
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  ProjectImage.MLogo,
                  height: 120,
                  width: 120,
                ),
                Text("PAYMENT REQUEST RECEIVED",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF303030),
                        fontWeight: FontWeight.w400,
                        fontSize: 21),
                    textAlign: TextAlign.center),
                SizedBox(height: 20,),
                Text(widget.amount,
                    style: GoogleFonts.poppins(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 21),textAlign: TextAlign.center),
                SizedBox(height: 10,),
                Text("From ${widget.Number}",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF303030),
                        fontWeight: FontWeight.w400,
                        fontSize: 19),
                    textAlign: TextAlign.center),
                SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            BottomScreen(amt: "",phone: "",)), (Route<dynamic> route) => false);
                      },
                      child: Image.asset(ProjectImage.cross,
                        height: 90,width: 90,
                      ),
                    ),
                    SizedBox(width: 40,),
                    InkWell(
                      onTap: (){
                        Helper.moveToScreenwithPush(context, AuthorizePayScreen(
                          amount: widget.amount,
                          frontUserPhone:widget.Number,
                        ));
                      },
                      child: Image.asset(ProjectImage.right,
                        height: 90,width: 90,
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: AppColor.secondaryColor),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        BottomScreen(amt: "",phone: "",)), (Route<dynamic> route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ProjectImage.home,
                        height: 30,width: 30,
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){

                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              BottomScreen(
                                amt: "1000",
                                phone: widget.Number ,
                              )),
                                  (Route<dynamic> route) => false);
                        },
                        child: Text("Home",
                            style: GoogleFonts.poppins(
                                color:Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 21),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }


 detailRec() async {

    print("--------------------detailReceiver---------------");

    var box = await Hive.openBox("transaction");

    // print("number--------------->${box.getAt(1).toString()}");
    // print("widget.amount--------------->${widget.amount}");

    setState(() {
      numberReceiver= box.getAt(1).toString();
    });


  }






}
