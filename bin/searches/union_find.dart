class UnionFind {
  List<int> _p = [];
  List<int> _r = [];

  UnionFind(int n) {
    _p = List.filled(n, 0);
    _r = List.filled(n, 0);

    for (int i = 0; i < n; i++) {
      _p[i] = i;
    }
  }

  int find(int i) {
    int parent = _p[i];

    if (i == parent) {
      return i;
    }

    return _p[i] = find(parent);
  }

  void union(int x, int y) {
    int r0 = find(x);
    int r1 = find(y);

    if (r1 == r0) {
      return;
    }

    if (_r[r0] > _r[r1]) {
      _p[r1] = r0;
    } else if (_r[r1] > _r[r0]) {
      _p[r0] = r1;
    } else {
      _p[r1] = r0;
      _r[r0]++;
    }
  }

  int count() {
    List parents = [];
    for (int i = 0; i < _p.length; i++) {
      if (!parents.contains(find(i))) {
        parents.add(find(i));
      }
    }
    return parents.length;
  }

  String toString() {
    return "p ${_p.toString()}   r ${_r.toString()} ";
  }
}

void main(List<String> args) {
  UnionFind uf = UnionFind(5);
  print("init /w 5 (should print 'p = [0, 1, 2, 3, 4] r = [0, 0, 0, 0, 0]'):");
  print(uf);

  uf.union(1, 2);
  print("union 1 2 (should print 'p = [0, 1, 1, 3, 4] r = [0, 1, 0, 0, 0]'):");
  print(uf);

  uf.union(3, 4);
  print("union 3 4 (should print 'p = [0, 1, 1, 3, 3] r = [0, 1, 0, 1, 0]'):");
  print(uf);

  uf.find(4);
  print("find 4 (should print 'p [0, 1, 1, 3, 3] r [0, 1, 0, 1, 0]'):");
  print(uf);

  print("count (should print '3'):");
  print(uf.count());
}
