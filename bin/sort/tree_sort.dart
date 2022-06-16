import 'sort_algorithm.dart';
import 'sort_utils.dart';

class TreeSort with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>>(List<T> unsortedArray) {
        return doTreeSortArray(unsortedArray);
    }

    @override
    sort1<T extends Comparable<T>>(List<T> unsortedList) {
        return doTreeSortList(unsortedList);
    }

    List<T>doTreeSortArray<T extends Comparable<T>>(List<T> unsortedArray) {
        
        BSTRecursiveGeneric<T> tree = new BSTRecursiveGeneric<T>();

        
        for (T element in unsortedArray) {
            tree.add(element);
        }

        
        List<T> sortedList = tree.inorderSort();

        
        int i = 0;
        for (T element in sortedList) {
            unsortedArray[i++] = element;
        }

        
        return unsortedArray;
    }

     List<T> doTreeSortList<T extends Comparable<T>>(List<T> unsortedList) {
        // create a generic BST tree
        BSTRecursiveGeneric<T> tree = new BSTRecursiveGeneric<T>();

        // add all elements to the tree
        for (T element : unsortedList) {
            tree.add(element);
        }

        // get the sorted list by inorder traversal of the tree and return it
        return tree.inorderSort();
     }
}
void main(List<String> args) {
        TreeSort treeSort = new TreeSort();

        // ==== Integer Array =======
        print("Testing for Integer Array....");
        List<int> a = [3, -7, 45, 1, 343, -5, 2, 9];
        print("%-10s  unsorted: ");
        print(a);
        print("%-10s  sorted: ");
        print(treeSort.sort<num>(a));

        // ==== Integer List =======
        print("Testing for Integer List....");
        List<int> intList = [3, -7, 45, 1, 343, -5, 2, 9];
        print("%-10s unsorted: ");
        print(intList);
        print("%-10s sorted: ");
        print(treeSort.sort<num>(intList));
        

        // ==== String Array =======
        print("Testing for String Array....");
        List b = ["banana", "berry", "orange", "grape", "peach", "cherry", "apple", "pineapple"];
        print("%-10s  unsorted: ");
        print(b);
        print( "%-10s  sorted: ");
        print(treeSort.sort(b));
        

        // ==== String List =======
        print("Testing for String List....");
        List stringList = ["banana", "berry", "orange", "grape", "peach", "cherry", "apple", "pineapple"];
        print("%-10s unsorted: ");
        print(stringList);
        print("%-10s sorted: ");
        print(treeSort.sort(stringList));

    }
