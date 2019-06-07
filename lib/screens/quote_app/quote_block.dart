import 'package:flutter/widgets.dart';
import 'package:saico_quotes/screens/quote_app/quote_body.dart';
import 'package:saico_quotes/screens/quote_app/quote_top_tag.dart';
import 'package:saico_quotes/shared/shared.dart';

class QuoteAnimatedBlock extends StatefulWidget {
  const QuoteAnimatedBlock({
    Key key,
  }) : super(key: key);
  @override
  _QuoteAnimatedBlockState createState() => _QuoteAnimatedBlockState();
}

class _QuoteAnimatedBlockState extends State<QuoteAnimatedBlock> {
  PageController controller = PageController();
  List<QuoteBlock> displayedQuotes = [
    QuoteBlock(quoteFuture: Globals.getRandomQuote())
  ];
  var currentPageValue = 0.0;
  _QuoteAnimatedBlockState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
        if (displayedQuotes.length <= controller.page.floor() + 1) {
          displayedQuotes.add(
            QuoteBlock(quoteFuture: Globals.getRandomQuote()),
          );
          print(displayedQuotes.length);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemBuilder: (context, position) {
          if (position == currentPageValue.floor()) {
            return Transform(
              transform: Matrix4.identity()
                ..scale(1.0, 1 - (currentPageValue - position)),
              child: displayedQuotes[position],
            );
          } else if (position == currentPageValue.floor() + 1) {
            return Transform(
              transform: Matrix4.identity()
                ..scale(1.0, (currentPageValue - position) + 1),
              alignment: FractionalOffset.bottomCenter,
              child: displayedQuotes[position],
            );
          } else {
            return displayedQuotes[position];
          }
        },
      ),
    );
  }
}

class QuoteBlock extends StatelessWidget {
  const QuoteBlock({
    Key key,
    @required this.quoteFuture,
  }) : super(key: key);

  final Future<Quote> quoteFuture;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(child: QuoteTopTag()),
        Container(
          child: FutureBuilder(
            future: quoteFuture,
            builder: (context, snapshot) {
              final quote = snapshot.hasData
                  ? snapshot.data
                  : Quote(message: '...consultando al hermano...');
              return QuoteBody(quote: quote);
            },
          ),
        ),
      ],
    );
  }
}
