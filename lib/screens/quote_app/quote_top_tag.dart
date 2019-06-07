import 'package:flutter/widgets.dart';
import 'package:saico_quotes/shared/shared.dart';

class QuoteTopTag extends StatelessWidget {
  const QuoteTopTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: Globals.horizontalPadding +
                (Globals.quoteIconSize - Globals.horizontalPadding)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "#SaicoQuotes",
            style: TextStyle(
              fontSize: Globals.fontSize / 3,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
