extension IterableX<T> on Iterable<T> {
  T? safeFirstWhere(bool Function(T) test) {
    final sublist = where(test);
    return sublist.isEmpty ? null : sublist.first;
  }
}

//https://stackoverflow.com/a/54031434/10494346
extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
