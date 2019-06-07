import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:saico_quotes/screens/quote_app/quote_block.dart';
import 'package:saico_quotes/shared/shared.dart';

import 'quote_footer.dart';

class QuoteApp extends StatefulWidget {
  const QuoteApp({
    Key key,
  }) : super(key: key);

  @override
  _QuoteAppState createState() => _QuoteAppState();
}

class _QuoteAppState extends State<QuoteApp> {
  GlobalKey _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Background(),
                Container(
                  child: Column(
                    children: [
                      if (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                        Spacer(),
                      Expanded(
                        child: QuoteAnimatedBlock(),
                        flex: 4,
                      ),
                      Spacer(
                        flex: 1,
                      )
                      // Expanded(child: QuoteFooter())
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: QuoteFooter(
                globalKey: _globalKey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
