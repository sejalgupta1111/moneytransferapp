import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/others/payment_receipt_screen.dart';

import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../helper/image.dart';



class PaymentScanScreenTwo extends StatefulWidget {
  const PaymentScanScreenTwo({Key? key}) : super(key: key);

  @override
  State<PaymentScanScreenTwo> createState() => _PaymentScanScreenTwoState();
}

class _PaymentScanScreenTwoState extends State<PaymentScanScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                Text("SCAN REQUEST QRC ON  RECEIVER DEVICE",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF303030),
                        fontWeight: FontWeight.w400,
                        fontSize: 21),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: (){
                    Helper.moveToScreenwithPush(context, PaymentReceiptScreen(amount: '',));
                  },
                  child: Image.asset(
                    ProjectImage.barCode,
                    height: 210,
                    fit: BoxFit.fitHeight,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Scanner",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF303030),
                        fontWeight: FontWeight.w500,
                        fontSize: 21),
                    textAlign: TextAlign.center),
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
                      Text("Home",
                          style: GoogleFonts.poppins(
                              color:Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 21),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
