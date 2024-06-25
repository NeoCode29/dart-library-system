class Stack<T> {
  List<T> _stackList = [];

  Stack() {
    _stackList = [];
  }

  // Menambahkan item ke stack
  void push(T item) {
    _stackList.add(item);
  }

  // Menghapus dan mengembalikan item teratas dari stack
  T pop() {
    if (!isEmpty()) {
      return _stackList.removeLast();
    } else {
      throw ("Stack is empty");
    }
  }

  // Mengembalikan item teratas dari stack tanpa menghapusnya
  T peek() {
    if (!isEmpty()) {
      return _stackList.last;
    } else {
      throw ("Stack is empty");
    }
  }

  // Memeriksa apakah stack kosong
  bool isEmpty() {
    return _stackList.isEmpty;
  }

  // Mengembalikan jumlah item dalam stack
  int size() {
    return _stackList.length;
  }

  // Menghapus semua item dalam stack
  void clear() {
    _stackList.clear();
  }
}
