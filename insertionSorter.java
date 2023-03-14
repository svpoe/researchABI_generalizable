/* Credit: Adapted from notes - CS112 BU
* 
*Use insertion sort because charges across electrode array are naturally "grouped" across array in many cases
*(insertion sort --> best for arrays that are almost sorted)
*/

import java.util.*;

public class insertionSorter {
    public static void insertionSort(int[] arr) {
        for (int i = 1; i < arr.length; i++) {
        //for (int i = 1; i < 4; i++) { // to test first 3 iterations
            if (arr[i] < arr[i-1]) {
                int toInsert = arr[i];

                int j = i;
                do {
                    arr[j] = arr[j-1];
                    j = j-1;
                } while (j > 0 && toInsert < arr[j-1]);

                arr[j] = toInsert;
            }
        }
    }

    // public static void main(String[] args) {
    //     int[] arr = { ***** };     // PLACE CHARGE DATA HERE
    //     insertionSort(arr);
    //     System.out.println(Arrays.toString(arr));
    // }
}
