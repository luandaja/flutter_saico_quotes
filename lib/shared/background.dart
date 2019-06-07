import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'globals.dart';

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Opacity(
        opacity: 0.5,
        child: BackgroundImage(),
      ),
    );
  }
}

class BackgroundImage extends StatefulWidget {
  const BackgroundImage({
    Key key,
  }) : super(key: key);

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  PageController controller = Globals.backgroundController;

  List images = [
    FadeInImage.assetNetwork(
      placeholder: 'assets/images/arequipa-resize.jpg',
      image: 'https://source.unsplash.com/featured/?nature',
      fit: BoxFit.cover,
    ),
    // NetworkImage('https://source.unsplash.com/featured/?nature')..resolve(null)
  ];
  _BackgroundImageState() {
    controller.addListener(() {
      setState(() {
        final maxLength = controller.page.floor() + 1;
        if (images.length <= maxLength) {
          images.add(
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/arequipa-resize.jpg',
              image: 'https://source.unsplash.com/featured/?nature,$maxLength',
              fit: BoxFit.cover,
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        itemBuilder: (context, position) {
          return images[position];
        });
  }
}
