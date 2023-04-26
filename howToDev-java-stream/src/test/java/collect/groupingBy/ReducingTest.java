package collect.groupingBy;

import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import org.example.model.Stock;
import org.junit.jupiter.api.Test;

public class ReducingTest {

  @Test
  void reducing(){

    Stock stock = new Stock("111", 6, "pc");
    Stock stock2 = new Stock("111", 8, "pc");
    Stock stock3 = new Stock("222", 10, "pc");

    List<Stock> list = List.of(stock, stock2, stock3);

    Map<String, Stock> collected = list.parallelStream().collect(Collectors.groupingBy(
        Stock::getArticleNo,
        getReducingCollector()));

    System.out.print(collected.toString());

  }
  private static Collector<Stock, ?, Stock> getReducingCollector() {

    return Collectors.reducing(
        new Stock(null, 0, null),
        (g1, g2) -> {

          if (g1.getArticleNo() == null) {
            return g2;
          }

          if (g2.getArticleNo() == null) {
            return g1;
          }

          g1.setQtty(g1.getQtty() + g2.getQtty());

          return g1;
        });
  }

}
