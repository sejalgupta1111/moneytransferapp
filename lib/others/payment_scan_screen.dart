import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/helper/image.dart';
import 'package:mollet/others/payment_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../home.dart';

class PaymentScanScreen extends StatefulWidget {
  const PaymentScanScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScanScreen> createState() => _PaymentScanScreenState();
}

class _PaymentScanScreenState extends State<PaymentScanScreen> {

  String _scanBarcode = 'Unknown';
  String barcodeScanRes = 'Unknown';

   String amount="1000";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // scanBarcode();
  }



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
                    Helper.moveToScreenwithPush(context, PaymentScreen(
                      amount: '',Number: '',));
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
                // ElevatedButton(
                //     onPressed: () =>
                //     startBarcodeScanStream(),
                //     // scanBarcode(),
                //     // scanQR(),
                //     child: const Text('QR scan')),
                // ElevatedButton(
                //     onPressed: () =>scanBarcode(),
                //     child: const Text('Barcode scan stream')),
                // Text('Scan result : $_scanBarcode\n',
                //     style: const TextStyle(fontSize: 20))
                // QrImage(
                //   data: 'Amount: $amount', // Concatenate the amount with a prefix or any necessary formatting
                //   version: QrVersions.auto,
                //   size: 50.0,
                // ),
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


  Future<void> scanQR() async {

    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', false, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
//barcode scanner flutter ant
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }


  Future<void> scanBarcode() async {
    // setProgress(true);
    String barcodeScanRes;
    bool scanInvalidWaiter=false;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _scanBarcode = await FlutterBarcodeScanner.scanBarcode('#ff6666',
          'Cancel', true, ScanMode.BARCODE,

      );
      print(_scanBarcode);

    } on PlatformException {
      _scanBarcode = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //
    //   print('barcodeScanRes = $barcodeScanRes');
    //
    //   // getUserDetails(barcodeScanRes);
    // });
    print('barcodeScanRes---------------- = $_scanBarcode');
    //exp

    // CollectionReference _collectionRef =
    // FirebaseFirestore.instance.collection('waiter');

    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    // querySnapshot.docs.forEach((element)
    // querySnapshot.docs.forEach((element) {
    // for(var element in  querySnapshot.docs) {
    //   //tempMapOfWaiterDertails[element["waiter_id"]]=element["waiter_name"];
    //   print("id waiter firebase===>${element.id.toString()}");
    //   if (element.id != barcodeScanRes) {
    //     print("Invalid id");
    //     scanInvalidWaiter = true;
    //   } else {
    //     print("no problem");
    //     scanInvalidWaiter = false;
    //     break;
    //   }
    // }
    // });

    //exp end
    if(_scanBarcode=="-1"){
      print("here-1");
      ToastMessage.msg("QR scanning failed");
      // setProgress(false);
    }else if(scanInvalidWaiter==true){
      ToastMessage.msg("Invalid Waiter ID");
      // setProgress(false);
      //  sendRequestById(barcodeScanRes);
    }else{
      // sendRequestToWaiterFirebase(barcodeScanRes);
      //  sendRequestById(barcodeScanRes);
    }
    //  setProgress(false);




  }


  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen(
            (barcode) =>
        print("---------amount-------------${barcode}"),);

  }

}
