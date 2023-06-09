package Object;

import java.util.Objects;
import org.junit.jupiter.api.Test;

public class ObjectTest {

  @Test
  void requireNonNullElse() {

    Integer i = null;

    Integer result = Objects.requireNonNullElse(i, 6);

    System.out.println(result);

  }

}
