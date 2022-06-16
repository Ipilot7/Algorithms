enum Color {
        WHITE, GRAY, BLACK
    }

class Vertex {
        final String label;      
        int weight;        
        int finished;
        Vertex predecessor;
        
        Color color = Color.WHITE;

        final List<String> next = [];

        Vertex(String label) {
            this.label = label;
        }
     }

 class Graph {

        final Map<String, Vertex> adj = {};

        void addEdge(String label, String next) {
            
            adj.addAll  put(label, Vertex(label));
            if (!next[0].isEmpty())
                Collections.addAll(adj.get(label).next, next);
        }
    }

  static class BackEdgeException extends RuntimeException {

        public BackEdgeException(String backEdge) {
            super("This graph contains a cycle. No linear ordering is possible. " + backEdge);
        }

    }


class TopologicalSort {
     
    int time=0;   
    List<String> sort(Graph graph) {
        List<String> list = [];
        graph.adj.forEach((name, vertex) -> {
            if (Vertex.color == Color.WHITE) {
                list.addFirst(sort(graph, vertex, list));
            }
        });
        return list;
    }

  
  String sort(Graph graph, Vertex u, List<String> list) {
        time++;
        u.weight = time;
        u.color = Color.GRAY;
        graph.adj.get(u.label).next.forEach(label -> {
            if (graph.adj.get(label).color == Color.WHITE) {
                graph.adj.get(label).predecessor = u;
                list.addFirst(sort(graph, graph.adj.get(label), list));
            } else if (graph.adj.get(label).color == Color.GRAY) {
             
                throw new BackEdgeException("Back edge: " + u.label + " -> " + label);
            }
        });
        u.color = Color.BLACK;
        time++;
        u.finished = time;
        return u.label;
    }
}

