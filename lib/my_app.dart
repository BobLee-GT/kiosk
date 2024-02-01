import 'package:flutter/material.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> profiles = [];
List<int> test = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
          var data = await testTicket();
          test = data;
          setState(() {});
          },
          child: Column(
            children: [
              Text(
                  'Print to Default Printer'),

              Text('${profiles.length > 0 ? profiles
                  .first.toString() : ''}', maxLines: 4,),
              Text(
                  '--${test.toList()}--'),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<int>> testTicket() async{
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];

    bytes += generator.text(
        'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
    bytes += generator.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ');
    bytes += generator.text('Special 2: blåbærgrød');

    bytes += generator.text('Bold text', styles: PosStyles(bold: true));
    bytes += generator.text('Reverse text', styles: PosStyles(reverse: true));
    bytes += generator.text('Underlined text',
        styles: PosStyles(underline: true), linesAfter: 1);
    bytes += generator.text('Align left', styles: PosStyles(align: PosAlign.left));
    bytes += generator.text('Align center', styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Align right',
        styles: PosStyles(align: PosAlign.right), linesAfter: 1);

    bytes += generator.text('Text size 200%',
        styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }
}