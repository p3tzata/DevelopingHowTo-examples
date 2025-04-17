package completableFuture;

import completableFuture.dummy.DummyApi;
import java.util.concurrent.CompletableFuture;

public class SimpleDemo {

  public static void main(String[] args) {

    System.out.println("Hello, World!");
    DummyApi dummyApi = new DummyApi();

    CompletableFuture.runAsync(() -> dummyApi.dummyCall()).whenComplete((r, e) -> {
      if (e != null) {
        System.out.println("Finish ok");
      }
    });

  }

}
