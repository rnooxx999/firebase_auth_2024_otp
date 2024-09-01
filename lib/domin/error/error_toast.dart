

String extractErrorMessage(dynamic onError) {
  RegExp pattern = RegExp(r'\[.*\] (.*)');

  Match? match = pattern.firstMatch(onError);

  if (match != null) {
    return match.group(1)!.trim();
  } else {
    return onError;
  }
}
