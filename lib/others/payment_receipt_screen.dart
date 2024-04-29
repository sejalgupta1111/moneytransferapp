import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mollet/others/payment_account_screen.dart';

import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../helper/image.dart';


class PaymentReceiptScreen extends StatefulWidget {
  String amount = "";

  PaymentReceiptScreen({required this.amount});

  @override
  State<PaymentReceiptScreen> createState() => _PaymentReceiptScreenState();
}

class _PaymentReceiptScreenState extends State<PaymentReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
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
                //old code
                // Text("RECEIPT",
                //     style: GoogleFonts.poppins(
                //         color: Color(0xFF000000),
                //         fontWeight: FontWeight.w500,
                //         fontSize: 22),
                //     textAlign: TextAlign.center),
                // SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(widget.amount,
                //         style: GoogleFonts.poppins(
                //             color: AppColor.secondaryColor,
                //             fontWeight: FontWeight.w500,
                //             fontSize: 21),textAlign: TextAlign.center),
                //     SizedBox(width: 15,),
                //     Image.asset(ProjectImage.right,
                //       height: 50,width: 50,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 40,),
                // Text("Paid Successfully",
                //     style: GoogleFonts.poppins(
                //         color: Color(0xFF303030),
                //         fontWeight: FontWeight.w400,
                //         fontSize: 22),
                //     textAlign: TextAlign.center),
                // SizedBox(height: 20,),
                //old code end

                //new code
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("PAID",
                        style: GoogleFonts.poppins(
                            color: Color(0xFF303030),
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                        textAlign: TextAlign.center),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColor.secondaryColor,
                          width: 1
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                    child: Text(widget.amount,
                        style: GoogleFonts.poppins(
                            color: AppColor.secondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 21),textAlign: TextAlign.center),
                  ),
                ),
                Lottie.asset(
                    ProjectImage.done_lottie,
                    height: 300,width: 300,
                    fit: BoxFit.fill,
                    repeat: false

                ),
                SizedBox(height: 25,),
                //new code end

                // Center(
                //   child: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //         border: Border.all(
                //             color: AppColor.secondaryColor,
                //             width: 1
                //         )
                //     ),
                //     child: MaterialButton(
                //       minWidth: MediaQuery.of(context).size.width / 1.2,
                //       height: 50,
                //       textColor: Colors.white,
                //       child: Text(
                //         "Statement",
                //         style: const TextStyle(
                //             color: Color(0xFF0047CB),
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold),
                //       ),
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(30)),
                //       onPressed: () {
                //         Helper.moveToScreenwithPush(context, PaymentAccountScreen(
                //           amount: widget.amount,
                //         ));
                //       },
                //     ),
                //   ),
                // ),

              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Column(
                children: [
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
                          Helper.moveToScreenwithPush(context, PaymentAccountScreen(
                            amount: widget.amount,
                          ));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
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
                                    phone: "9191919191",
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
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
