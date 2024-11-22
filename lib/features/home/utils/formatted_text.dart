import 'package:flutter/material.dart';

Text formattedText({
  required String corpus,
  required String searchedWord,
  required BuildContext context,
}) {
  if (corpus.isEmpty || searchedWord.isEmpty) {
    return Text(corpus);
  }

  final RegExp regExp = RegExp(searchedWord, caseSensitive: false);

  final Iterable<Match> matches = regExp.allMatches(corpus);

  final List<TextSpan> textSpans = [];

  int currentIndex = 0;

  for (final Match match in matches) {
    textSpans.add(TextSpan(text: corpus.substring(currentIndex, match.start)));

    textSpans.add(
      TextSpan(
        text: corpus.substring(match.start, match.end),
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    currentIndex = match.end;
  }

  textSpans.add(TextSpan(text: corpus.substring(currentIndex)));

  return Text.rich(TextSpan(children: textSpans));
}
