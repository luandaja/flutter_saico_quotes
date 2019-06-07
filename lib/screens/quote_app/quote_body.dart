import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saico_quotes/shared/shared.dart';

class QuoteBody extends StatelessWidget {
  QuoteBody({
    Key key,
    this.quote,
  }) : super(key: key);
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    // var quoteMessage = _getRandomQuote();
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.5,
            child: Icon(
              FontAwesomeIcons.quoteLeft,
              size: Globals.quoteIconSize,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: Globals.quoteIconSize - 16,
                right: Globals.horizontalPadding / 2,
              ),
              child: AutoSizeText(
                quote.message,
                style: TextStyle(
                  fontSize: Globals.fontSize,
                  fontWeight: FontWeight.w600,
                ),
                maxLines:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 7
                        : 4,
                maxFontSize: Globals.fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
