mixin SortUtils {

 bool swap<T>(List<T> array, int idx, int idy) {
    T swap = array[idx];
    array[idx] = array[idy];
    array[idy] = swap;
    return true;
  }
bool less<T extends Comparable <T>>(T v, T w) {
  return v.compareTo(w) < 0;}
  // bool less<T extends Comparable <T>>(T v, T w) => v.compareTo(w) < 0;

  bool greater<T extends Comparable <T>>(T v, T w)=> v.compareTo(w) > 0;

  bool greaterOrEqual<T extends Comparable <T>>(T v, T w) => v.compareTo(w) >= 0;


  flip<T extends Comparable <T>>(List<T> array, int left, int right) {
    while (left <= right) {
      swap(array, left++, right--);
    }
  }
}
