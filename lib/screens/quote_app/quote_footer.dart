import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saico_quotes/shared/shared.dart';

class QuoteFooter extends StatefulWidget {
  const QuoteFooter({
    Key key,
    this.globalKey,
  }) : super(key: key);
  final GlobalKey globalKey;

  @override
  _QuoteFooterState createState() => _QuoteFooterState(this.globalKey);
}

class _QuoteFooterState extends State<QuoteFooter> {
  final GlobalKey globalKey;
  _QuoteFooterState(this.globalKey);
  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();

      ui.Image image = await boundary.toImage(pixelRatio: 1.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded(
          //   child: IconButton(
          //     onPressed: () {},
          //     iconSize: Globals.fontSize / 1.5,
          //     icon: Icon(FontAwesomeIcons.solidHeart),
          //   ),
          // ),
          Expanded(
            child: IconButton(
              onPressed: () async {
                var pngBytes = await _capturePng();
                Share.file("Quote", "Quote.png", pngBytes, "image/png");
              },
              iconSize: Globals.fontSize / 1.5,
              icon: Icon(FontAwesomeIcons.shareAlt),
            ),
          )
        ],
      ),
    );
  }
}
