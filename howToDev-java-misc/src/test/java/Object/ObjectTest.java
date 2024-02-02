package Object;

import java.util.Objects;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

public class ObjectTest {

  @Test
  void requireNonNullElse() {

    Integer i = null;

    Integer result = Objects.requireNonNullElse(i, 6);

    System.out.println(result);

  }

  @Test
  void equals() {

    Integer a = 10;
    Integer b = null;

    boolean result = Objects.equals(a, b);

    Assertions.assertThat(result).isFalse();
    System.out.println(result);

  }


}
