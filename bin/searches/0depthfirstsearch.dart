class Node {
  late final String _name;
  late final List<Node> _subNodes;

  Node(this._name, [_subNodes]) {
    this._subNodes = _subNodes ?? [];
  }

  String getName() {
    return _name;
  }

  List<Node> getSubNodes() {
    return _subNodes;
  }
}

class DepthFirstSearch {
  Node search(Node node, final String name) {
    if (node.getName() == name) {
      return node;
    }
    return node.getSubNodes().firstWhere((element) {
      search(element, name);
      return element.getName() == name
    });
  }

  assertThat(final Object actual, final Object expected) {
    if (!identical(actual, expected)) {
      throw AssertionError("expected=$expected but was actual=$actual");
    }
  }
}

void main() {
  final Node rootNode = Node(
      "A",
      List.of([
        Node(
            "B",
            List.of([
              Node("D"),
              Node("F", List.of([Node("H"), Node("I")]))
            ])),
        Node("C", List.of([Node("G")])),
        Node("E")
      ]));
  var search = DepthFirstSearch();

  final String expected = "I";
  try {
    final Node result = search.search(rootNode, expected);
    search.assertThat(result.getName(), expected);
  } on Error {
    print("Node is not found");
  }

  // String expected = "G";

  // final Node result = search(rootNode, expected)
  //         .orElseThrow(() -> new AssertionError("Node not found!"));

  // assertThat(result.getName(), expected);

  //  String expected = "E";

  // final Node result = search(rootNode, expected)
  //         .orElseThrow(() -> new AssertionError("Node not found!"));

  // assertThat(result.getName(), expected);
}
