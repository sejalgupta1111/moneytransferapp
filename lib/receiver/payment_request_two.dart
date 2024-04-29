import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/receiver/payment_account_receiver.dart';

import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../helper/image.dart';


class PaymentRequestTwo extends StatefulWidget {
  const PaymentRequestTwo({Key? key}) : super(key: key);

  @override
  State<PaymentRequestTwo> createState() => _PaymentRequestTwoState();
}

class _PaymentRequestTwoState extends State<PaymentRequestTwo> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Payment Request",
                        style: GoogleFonts.poppins(
                            color: Color(0xFF303030),
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                        textAlign: TextAlign.center),


                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ProjectImage.right,
                      height: 35,width: 35,
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: AppColor.secondaryColor,
                              width: 1
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                        child: Text("₹ 120.00",
                            style: GoogleFonts.poppins(
                                color: AppColor.secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 21),textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text("Request QRC",
                    style: GoogleFonts.poppins(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 21),textAlign: TextAlign.center),
                SizedBox(height: 15,),
                Image.asset(
                  ProjectImage.barCode,
                  height: 210,
                  fit: BoxFit.fitHeight,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 20,),
                Text("Allow Payer to Scan QR Code",
                    style: GoogleFonts.poppins(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 19),
                    textAlign: TextAlign.center),
                SizedBox(height: 15,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: AppColor.secondaryColor,
                            width: 1
                        )
                    ),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Statement",
                        style: const TextStyle(
                            color: Color(0xFF0047CB),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        // Helper.moveToScreenwithPush(context, PaymentAccountReceiver());
                      },
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     InkWell(
                //       onTap: (){
                //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                //             BottomScreen()), (Route<dynamic> route) => false);
                //       },
                //       child: Image.asset(ProjectImage.cross,
                //         height: 70,width: 70,
                //       ),
                //     ),
                //     SizedBox(width: 40,),
                //     InkWell(
                //       onTap: (){
                //
                //         // Helper.moveToScreenwithPushreplaceemt(context, PaymentScanScreenTwo());
                //       },
                //       child: Image.asset(ProjectImage.right,
                //         height: 70,width: 70,
                //       ),
                //     )
                //   ],
                // )
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
