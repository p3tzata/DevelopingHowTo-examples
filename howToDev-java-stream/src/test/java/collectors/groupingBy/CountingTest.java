package collectors.groupingBy;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import org.example.model.Stock;
import org.junit.jupiter.api.Test;

public class CountingTest {

  @Test
  void counting() {

    List<Stock> list = List.of(
        new Stock("111", 8, "pc"),
        new Stock("111", 8, "pc"),
        new Stock("111", 8, "gm"),
        new Stock("222", 10, "gm"),
        new Stock("222", 10, "gm"),
        new Stock("222", 10, "gm"),
        new Stock("222", 10, "pc"),
        new Stock("222", 10, "pc")
    );

    Map<String, Map<String, Long>> collected = list.parallelStream().collect(Collectors.groupingBy(
        Stock::getArticleNo,
        Collectors.groupingBy(Stock::getUom, Collectors.counting())));

    System.out.println("Collected" + collected.toString());
    System.out.println("");
    collected.entrySet().stream().forEach(es ->
    {
      System.out.println("Sorting " + es.getKey());
      ArrayList<Entry<String, Long>> entries = new ArrayList<>(es.getValue().entrySet());
      System.out.println("Before Sorting" + entries.toString());

      entries.sort(Entry.<String, Long>comparingByValue().reversed());

      System.out.println("After Sorting" + entries.toString());
      System.out.println("");
    });


  }


}
