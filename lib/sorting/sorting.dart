void main(List<String> args) {
  final list = [3, 1, 5, 2, 4, 7, 6];

  print('Sorted with selectionSort: ${Sorting.selectionSort(list)}');
  print('Sorted with insertionSort: ${Sorting.insertionSort(list)}');
  print('Sorted with bubbleSort: ${Sorting.bubbleSort(list)}');
  print('Sorted with quickSort: ${Sorting.quickSort(list)}');
  print('Sorted with mergeSort: ${Sorting.mergeSort(list)}');
}

class Sorting {
  static List<int> selectionSort(List<int> list) {
    // O(n^2)

    for (int i = 0; i < list.length; i++) {
      int min = i;

      for (int j = i + 1; j < list.length; j++) {
        if (list[j] < list[min]) {
          min = j;
        }
      }

      int temp = list[i];
      list[i] = list[min];
      list[min] = temp;
    }
    return list;
  }

  static List<int> insertionSort(List<int> list) {
    // O(n^2)

    for (int i = 1; i < list.length; i++) {
      int j = i - 1;
      int key = list[i];
      while (j >= 0 && list[j] > key) {
        list[j + 1] = list[j];
        j--;
      }

      list[j + 1] = key;
    }
    return list;
  }

  static List<int> bubbleSort(List<int> list) {
    // O(n^2)
    for (int i = 0; i < list.length; i++) {
      for (int j = 0; j < list.length - i - 1; j++) {
        if (list[j] > list[j + 1]) {
          int temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
    return list;
  }

  static List<int> quickSort(List<int> list) {
    // O(n log n)
    if (list.length <= 1) {
      return list;
    }

    final pivot = list[0];
    final left = <int>[];
    final right = <int>[];

    for (int i = 1; i < list.length; i++) {
      if (list[i] < pivot) {
        left.add(list[i]);
      } else {
        right.add(list[i]);
      }
    }
    return [
      ...(left.length <= 1 ? left : quickSort(left)),
      pivot,
      ...(right.length <= 1 ? right : quickSort(right)),
    ];
  }

  static List<int> mergeSort(List<int> list) {
// O(n log n)

    if (list.length <= 1) {
      return list;
    }

    final middle = list.length ~/ 2;
    final left = list.sublist(0, middle);
    final right = list.sublist(middle);

    return _merge(mergeSort(left), mergeSort(right));
  }

  static List<int> _merge(List<int> left, List<int> right) {
    final result = <int>[];

    while (left.isNotEmpty && right.isNotEmpty) {
      if (left.first <= right.first) {
        result.add(left.removeAt(0));
      } else {
        result.add(right.removeAt(0));
      }
    }

    return [...result, ...left, ...right];
  }
}
