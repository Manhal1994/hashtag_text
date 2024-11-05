# hashtag_text
Text widgets that can detect hashtags with callback when a user tap on the hashtag.

```import 'package:flutter/material.dart';
import 'package:hashtagable_text/hashtag_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HashTagText(
          text: "This is a #text with a some #hashtags for #testing.",
          onHashTagTap: (hastTag) {
            debugPrint(hastTag);
          },
        ),
      ))),
    );
  }
}
```





