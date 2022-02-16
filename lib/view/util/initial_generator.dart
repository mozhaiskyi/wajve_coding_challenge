const _maxLength = 2;

String generateInitialFromName({required String name}) {
  if (name.isEmpty) return '';

  final parts = name
      .split(' ')
      .where((element) => !element.contains('.'))
      .map((e) => e[0])
      .take(_maxLength);

  return parts.join().toUpperCase();
}
