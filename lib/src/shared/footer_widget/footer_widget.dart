import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Column,
        Divider,
        FontWeight,
        InkWell,
        Key,
        MainAxisAlignment,
        MainAxisSize,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl;

class KFooterWidget extends StatelessWidget {
  const KFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50.0),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Developed by ',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () async => await canLaunchUrl(
                      Uri.parse('https://algoramming.github.io/'))
                  ? await launchUrl(Uri.parse('https://algoramming.github.io/'))
                  : throw 'Could not launch the url',
              child: Text(
                'Algoramming',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[700],
                ),
              ),
            ),
            // const Text(
            //   ' in 💙 with ',
            //   style: TextStyle(
            //     fontSize: 13,
            //     fontWeight: FontWeight.w500,
            //     color: Colors.black,
            //   ),
            // ),
            // InkWell(
            //   onTap: () async =>
            //       await canLaunchUrl(Uri.parse('https://flutter.dev/'))
            //           ? await launchUrl(Uri.parse('https://flutter.dev/'))
            //           : throw 'Could not launch the url',
            //   child: Text(
            //     'Flutter',
            //     style: TextStyle(
            //       fontSize: 13,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.blue[700],
            //     ),
            //   ),
            // ),
          ],
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
