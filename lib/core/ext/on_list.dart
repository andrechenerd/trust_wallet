extension OnIterableExt<T> on Iterable<T> {
  Map<K, V> toMap<K, V>({
    required K Function(T item) keyBuilder,
    required V Function(T item) valueBuilder,
  }) {
    final resultMap = <K, V>{};
    for (var element in this) {
      resultMap[keyBuilder(element)] = valueBuilder(element);
    }
    return resultMap;
  }
}

extension OnListExt<T> on List<T> {
  List<T> separate(T separator) {
    for (var i = 1; i < length; i += 2) {
      insert(i, separator);
    }
    return this;
  }

  List<R> separatedMap<R>(R Function(T) map, R separator) {
    if (isEmpty) return <R>[];
    List<R> result = [map(first)];
    for (var i = 1; i < length; i++) {
      result.add(separator);
      result.add(map(this[i]));
    }
    return result;
  }
}
