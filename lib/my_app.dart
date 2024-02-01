import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String ip = 'auto';
  String text = '', status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print $ip'),
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  // res = await printer.connect('192.168.1.31', port: 9100);
                  text = 'Processing...';
                  setState(() {});
                  await autoPrint('text');
                  setState(() {});
                },
                child: Column(
                  children: [
                    Text(
                      'Print ',
                    ),
                  ],
                ),
              ),
              Text(
                'Text - $text',
                maxLines: 10,
              ),
              Text(
                'Status - $status',
                maxLines: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    ip = '192.168.1.31';
                    setState(() {});
                  },
                  child: const Text('IP 192.168.1.31')),

              ElevatedButton(
                  onPressed: () {
                    ip = '192.168.0.123';
                    setState(() {});
                  },
                  child: const Text('IP 192.168.0.123')),

              ElevatedButton(
                  onPressed: () {
                    ip = 'USB001';
                    setState(() {});
                  },
                  child: const Text('IP USB001'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> autoPrint(String testText) async {
    try {
      final profile = await CapabilityProfile.load();
      print('${profile.name}');
      final printer = NetworkPrinter(PaperSize.mm80, profile);
      status = 'Connecting';
      setState(() {});
      // Kết nối đến máy in mặc định (có thể có vấn đề tương thích)
      final PosPrintResult res =
          await printer.connect(ip, port: 9100);

      if (res != PosPrintResult.success) {
        text = 'Could not connect to the default printer. Error: ${res.value}';
        setState(() {});
        return;
      }

      text = 'Connect printer successed';
      setState(() {});
      printer.text(testText, styles: PosStyles(align: PosAlign.left));
      printer.feed(2);

      if (res == PosPrintResult.success) {
        status = 'Print successful';
        setState(() {});
      } else {
        status = 'Print failed. Error: $res';
        setState(() {});
      }
    } catch (e) {
      text = '$e';
      setState(() {});
    }
  }
}
