library hashtag_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HashTagText extends StatelessWidget {
  HashTagText(
      {super.key,
      required this.text,
      this.textStyle,
      this.hashtagStyle,
      this.onHashTagTap});
  final String text;
  final hashtagRegExp = RegExp(r"#\b\w+\b");
  final Map<String, String> parsedText = {};
  final Function(String)? onHashTagTap;
  final TextStyle? textStyle;
  final TextStyle? hashtagStyle;

  @override
  Widget build(BuildContext context) {
    int start = 0;
    String left = "";
    List<String> hashtags = extractDetections(text, hashtagRegExp);
    for (var hashtag in hashtags) {
      int hashTagIndex = text.indexOf(hashtag);
      parsedText[hashtag] = (text.substring(start, hashTagIndex));
      start = hashTagIndex + hashtag.length;
    }
    left = text.substring(start, text.length);

    return Text.rich(TextSpan(
      text: "",
      style: textStyle,
      children: hashtags
          .map((e) => TextSpan(text: parsedText[e], children: [
                TextSpan(
                    text: e,
                    recognizer: onHashTagTap != null
                        ? (TapGestureRecognizer()
                          ..onTap = () {
                            onHashTagTap!(e);
                          })
                        : null,
                    style: hashtagStyle ??
                        const TextStyle(color: Colors.blueAccent))
              ]))
          .toList()
        ..add(TextSpan(text: left, style: textStyle)),
    ));
  }
}

List<String> extractDetections(String text, RegExp regExp) {
  return regExp.allMatches(text).map((match) => match.group(0)!).toList();
}
