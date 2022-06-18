class Node<T> {
  late T data;
  Node(this.data);

  T getData() {
    return data;
  }

  void setData(T data) {
    this.data = data;
  }
}
