package lsd;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class LSD {

  public static void main(String[] args) {

    List<Integer>[] bucket = new ArrayList[10];
    initBucket(bucket);
    int[] elements = {450, 120, 200000065, 464, 100000065, 43562, 125};

    int max = Arrays.stream(elements).max().getAsInt();
    int maxIndex = findMaxIndex(max);

    for (int i = 0; i < maxIndex; i++) {

      for (int j = 0; j < elements.length; j++) {

        bucket[calc(elements[j], i)].add(elements[j]);

      }
      String d1 = "";

      int curIndexEl = 0;
      for (int k = 0; k < bucket.length; k++) {

        Iterator<Integer> iterator = bucket[k].iterator();
        while (iterator.hasNext()) {
          elements[curIndexEl] = iterator.next();
          curIndexEl++;
        }
        String d2 = "";
      }
      String d3 = "";

      //init bucket
      initBucket(bucket);


    }
    System.out.println(Arrays.toString(elements));
    String d4 = "";

  }

  private static int findMaxIndex(int max) {

    int tmp = max;
    int count = 1;
    while (tmp > 1) {
      tmp = tmp / 10;
      count++;
    }
    return count;

  }

  private static void initBucket(List<Integer>[] bucket) {

    for (int i = 0; i < bucket.length; i++) {
      bucket[i] = new ArrayList<>();         // initialize each list
    }
  }

  private static int calc(int var, int indx) {

    return (var / (int) Math.pow(10, indx)) % 10;

  }

}
