import 'dart:io';

class Node<T> {
  T data;
  Node<T>? left;
  Node<T>? right;

  /**
         * Constructor with data as parameter
         */
  Node(this.data) {
    left = null;
    right = null;
  }
}

class BSTRecursiveGeneric<T extends Comparable<T>> {
  Node<T>? _root;

  BSTRecursiveGeneric() {
    _root = null;
  }

  Node<T>? _delete(Node<T>? node, T data) {
    if (node == null) {
      print("No such data present in BST.");
    } else if (node.data.compareTo(data) > 0) {
      node.left = _delete(node.left, data);
    } else if (node.data.compareTo(data) < 0) {
      node.right = _delete(node.right, data);
    } else {
      if (node.right == null && node.left == null) {
        // If it is leaf node
        node = null;
      } else if (node.left == null) {
        // If only right node is present
        Node<T> temp = node.right!;
        node.right = null;
        node = temp;
      } else if (node.right == null) {
        // Only left node is present
        Node<T> temp = node.left!;
        node.left = null;
        node = temp;
      } else {
        // both child are present
        Node<T> temp = node.right!;
        // Find leftmost child of right subtree
        while (temp.left != null) {
          temp = temp.left!;
        }
        node.data = temp.data;
        node.right = _delete(node.right, temp.data);
      }
    }
    return node;
  }

  Node<T> _insert(Node<T>? node, T data) {
    if (node == null) {
      node = Node(data);
    } else if (node.data.compareTo(data) > 0) {
      node.left = _insert(node.left, data);
    } else if (node.data.compareTo(data) < 0) {
      node.right = _insert(node.right, data);
    }
    return node;
  }

  void _preOrder(Node<T>? node) {
    if (node == null) {
      return;
    }
    stdout.write("${node.data} ");
    if (node.left != null) {
      _preOrder(node.left);
    }
    if (node.right != null) {
      _preOrder(node.right);
    }
  }

  void _postOrder(Node<T>? node) {
    if (node == null) {
      return;
    }
    if (node.left != null) {
      _postOrder(node.left);
    }
    if (node.right != null) {
      _postOrder(node.right);
    }
    stdout.write("${node.data} ");
  }

  void _inOrder(Node<T>? node) {
    if (node == null) {
      return;
    }
    if (node.left != null) {
      _inOrder(node.left);
    }
    print("${node.data} ");
    if (node.right != null) {
      _inOrder(node.right);
    }
  }

  void _inOrderSort(Node<T>? node, List<T> sortedList) {
    if (node == null) {
      return;
    }
    if (node.left != null) {
      _inOrderSort(node.left, sortedList);
    }
    sortedList.add(node.data);
    if (node.right != null) {
      _inOrderSort(node.right, sortedList);
    }
  }

  bool _search(Node<T>? node, T data) {
    if (node == null) {
      return false;
    } else if (node.data.compareTo(data) == 0) {
      return true;
    } else if (node.data.compareTo(data) > 0) {
      return _search(node.left, data);
    } else {
      return _search(node.right, data);
    }
  }

  void add(T data) {
    this._root = _insert(this._root, data);
  }

  void remove(T data) {
    this._root = _delete(this._root, data);
  }

  void _inorder() {
    print("Inorder traversal of this tree is:");
    _inOrder(this._root);
    print(""); // for next line
  }

  /**
     * return a sorted list by traversing the tree elements using inorder
     * traversal
     */
  List<T> inorderSort() {
    List<T> sortedList = [];
    _inOrderSort(this._root, sortedList);
    return sortedList;
  }

  void postorder() {
    print("Postorder traversal of this tree is:");
    _postOrder(this._root);
    print(""); // for next line
  }

  /**
     * To call preorder traversal on tree.
     */
  void preorder() {
    print("Preorder traversal of this tree is:");
    _preOrder(this._root);
    print(""); // for next line
  }

  /**
     * To check if given value is present in tree or not.
     *
     * @param data the data to be found for
     */
  bool find(T data) {
    if (_search(this._root, data)) {
      print("$data is present in given BST.");
      return true;
    }
    print("$data not found.");
    return false;
  }

  /**
     * The generic Node class used for building binary search tree
     */

}
