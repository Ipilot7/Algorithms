class LinkList_Sort {
  bool isSorted(List<int> p, int option) {
    List<int> a = p;

    List<int> b = p;

    int ch = option;

    switch (ch) {
      case 1:
        Task nm = Task();
        Node? start, prev, fresh, ptr;
        for (int i = 0; i < a.length; i++) {
          fresh = Node();
          fresh.val = a[i];
          if (start == null)
            start = fresh;
          else
            prev!.next = fresh;
          prev = fresh;
        }
        start = nm.sortByMergesort(start!);
        // method is being called
        int i = 0;
        for (ptr = start; ptr != null; ptr = ptr.next) {
          a[i++] = ptr.val!;
          // storing the sorted values in the array
        }
        b.sort();
        // array b is sorted and it will return true when checked with sorted list
        LinkList_Sort uu = LinkList_Sort();
        if (uu.compare(a, b)) {
          return true;
        } else {
          return false;
        }
      // The given array and the expected array is checked if both are same then true is displayed else false is displayed
      case 2:
        Node? start1, prev1, fresh1, ptr1;
        for (int i1 = 0; i1 < a.length; i1++) {
          // New nodes are created and values are added
          fresh1 = Node(); // New node is created
          fresh1.val = a[i1]; // Value is stored in the value part of the node
          if (start1 == null)
            start1 = fresh1;
          else
            prev1?.next = fresh1;
          prev1 = fresh1;
        }
        Task1 kk = Task1();
        start1 = kk.sortByInsertionsort(start1!);
        // method is being called
        int i1 = 0;
        for (ptr1 = start1; ptr1 != null; ptr1 = ptr1.next) {
          a[i1++] = ptr1.val!;
          // storing the sorted values in the array
        }
        LinkList_Sort uu1 = new LinkList_Sort();
        // array b is not sorted and it will return false when checked with sorted list
        if (uu1.compare(a, b)) {
          return true;
        } else {
          return false;
        }
      // The given array and the expected array is checked if both are same then true is displayed else false is displayed
      case 3:
        Task2 mm = Task2();
        Node? start2, prev2, fresh2, ptr2;
        for (int i2 = 0; i2 < a.length; i2++) {
          // New nodes are created and values are added
          fresh2 = new Node(); // Node class is created
          fresh2.val = a[i2]; // Value is stored in the value part of the Node
          if (start2 == null)
            start2 = fresh2;
          else
            prev2?.next = fresh2;
          prev2 = fresh2;
        }
        start2 = mm.sortByHeapsort(start2!);
        // method is being called
        int i3 = 0;
        for (ptr2 = start2; ptr2 != null; ptr2 = ptr2.next) {
          a[i3++] = ptr2.val!;
          // storing the sorted values in the array
        }
        b.sort();
        // array b is sorted and it will return true when checked with sorted list
        LinkList_Sort uu2 = new LinkList_Sort();
        if (uu2.compare(a, b)) {
          return true;
        } else {
          return false;
        }
      // The given array and the expected array is checked if both are same then true is displayed else false is displayed
      default:
        // default is used incase user puts a unauthorized value
        print("Wrong choice");
    }
    // Switch case is used to call the classes as per the user requirement
    return false;
  }

  bool compare(List<int> a, List<int> b) {
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
    // Both the arrays are checked for equalness. If both are equal then true is returned else false is returned
  }
}

class Node {
  int? val;
  Node? next;
  // Node class for creation of linklist nodes
}

class Task {
  List<int> a = [];

  Node? sortByMergesort(Node head) {
    if (head == null || head.next == null) return head;
    int c = count(head);
    List<int> a = List.filled(c, 0);
    // Array of size c is created
    int i = 0;
    for (Node? ptr = head; ptr != null; ptr = ptr.next) {
      a[i++] = ptr.val!;
    }
    // values are stored in the array
    i = 0;
    task(a, 0, c - 1);
    // task method will be executed
    for (Node? ptr = head; ptr != null; ptr = ptr.next) {
      ptr.val = a[i++];
      // Value is stored in the linklist after being sorted
    }
    return head;
  }

  int count(Node head) {
    int c = 0;
    Node? ptr;
    for (ptr = head; ptr != null; ptr = ptr.next) {
      c++;
    }
    return c;
    // This Method is used to count number of elements/nodes present in the linklist
    // It will return a integer type value denoting the number of nodes present
  }

  void task(List<int> n, int i, int j) {
    if (i < j) {
      int m = ((i + j) ~/ 2);
      task(n, i, m);
      task(n, m + 1, j);
      task1(n, i, m, j);
    }
  }

  void task1(List<int> n, int s, int m, int e) {
    int i = s, k = 0, j = m + 1;
    List<int> b = List.filled(e - s + 1, 0);
    while (i <= m && j <= e) {
      if (n[j] >= n[i])
        b[k++] = n[i++];
      else
        b[k++] = n[j++];
    }
    // Smallest number is stored after checking from both the arrays
    while (i <= m) {
      b[k++] = n[i++];
    }
    while (j <= e) {
      b[k++] = n[j++];
    }
    for (int p = s; p <= e; p++) {
      a[p] = b[p - s];
    }
  }
  // The method task and task1 is used to sort the linklist using merge sort
}

class Task1 {
  Node? sortByInsertionsort(Node head) {
    if (head == null || head.next == null) return head;
    int c = count(head);
    List<int> a = List.filled(c, 0);

    a[0] = head.val!;
    int i = 1;
    Node? ptr;
    for (ptr = head; ptr != null; ptr = ptr.next, i++) {
      int j = i - 1;
      while (j >= 0 && a[j] > ptr.val!) {
        a[j + 1] = a[j];
        j--;
      }
      a[j + 1] = ptr.val!;
    }
    i = 0;
    for (ptr = head; ptr != null; ptr = ptr.next) {
      ptr.val = a[i++];
      // Value is stored in the linklist after being sorted
    }
    return head;
  }

  int count(Node head) {
    Node? ptr;
    int c = 0;
    for (ptr = head; ptr != null; ptr = ptr.next) {
      c++;
    }
    return c;
  }
}

class Task2 {
  List<int> a = [];

  Node? sortByHeapsort(Node head) {
    if (head == null || head.next == null) return head;
    int c = count(head);
    List<int> a = List.filled(c, 0);

    int i = 0;
    for (Node? ptr = head; ptr != null; ptr = ptr.next) {
      a[i++] = ptr.val!;
    }
    i = 0;
    task(a);
    for (Node? ptr = head; ptr != null; ptr = ptr.next) {
      ptr.val = a[i++];
      // Value is stored in the linklist after being sorted
    }
    return head;
  }

  int count(Node head) {
    int c = 0;
    Node? ptr;
    for (ptr = head; ptr != null; ptr = ptr.next) {
      c++;
    }
    return c;
  }

  void task(List<int> n) {
    int k = n.length;
    for (int i = (k / 2 - 1).toInt(); i >= 0; i--) {
      task1(n, k, i);
    }
    for (int i = k - 1; i > 0; i--) {
      int d = n[0];
      n[0] = n[i];
      n[i] = d;
      task1(n, i, 0);
    }
  }

  void task1(List<int> n, int k, int i) {
    int p = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    if (l < k && n[l] > n[p]) p = l;
    if (r < k && n[r] > n[p]) p = r;
    if (p != i) {
      int d = n[p];
      n[p] = n[i];
      n[i] = d;
      task1(n, k, p);
    }
  }
}

void main(List<String> args) {
  LinkList_Sort linkList_Sort = LinkList_Sort();

  List<int> v = [1, 2, 3, 2, 3, 2, 1, 2, 3, 2, 21, 2, 3];
  print(linkList_Sort.isSorted(v, 0));
  linkList_Sort.
}
