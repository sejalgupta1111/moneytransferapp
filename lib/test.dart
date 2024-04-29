import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'helper/constant.dart';


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: MaterialButton(
                color: AppColor.secondaryColor,
                minWidth: MediaQuery.of(context).size.width / 1.2,
                height: 50,
                textColor: Colors.white,
                child: Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {

                  // scanBarcode();
                  Helper.moveToScreenwithPush(context,QRCodePage(amount: "1000",) );
                },
              ),
            ),
            // Center(
            //   child: PrettyQr(
            //     // image: AssetImage('images/twitter.png'),
            //     size: 200,
            //     // data: "49",
            //     data: "1",
            //     errorCorrectLevel: QrErrorCorrectLevel.M,
            //     typeNumber: null,
            //     roundEdges: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    // setProgress(true);
    String barcodeScanRes;
    bool scanInvalidWaiter=false;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    print('barcodeScanRes = $barcodeScanRes');

    if(barcodeScanRes=="-1"){
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






}


class QRCodePage extends StatelessWidget {
  final String amount;

  QRCodePage({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: 'Amount: $amount', // Concatenate the amount with a prefix or any necessary formatting
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 16.0),
            Text('Amount: $amount'), // Display the amount below the QR code
          ],
        ),
      ),
    );
  }
}

