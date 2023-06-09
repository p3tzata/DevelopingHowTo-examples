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
        (x1, x2) -> {

          if (x1.getArticleNo() == null) {
            return x2;
          }

          if (x2.getArticleNo() == null) {
            return x1;
          }

          x1.setQtty(x1.getQtty() + x2.getQtty());

          return x1;
        });
  }

}
