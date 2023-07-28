package Optional;

import java.util.Optional;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

public class orElse {

  @Test
  public void orElse_null() {

    Long valLong = null;
    Optional<Long> valLong1 = Optional.ofNullable(valLong);

    Long aLong = valLong1.orElse(null);
    Long aLongDefault = valLong1.orElse(69L);

    Assertions.assertThat(aLong).isEqualTo(null);
    Assertions.assertThat(aLongDefault).isEqualTo(69L);

  }

  @Test
  public void orElse_nonNull() {

    Long valLong = 1L;
    Optional<Long> valLong1 = Optional.ofNullable(valLong);

    Long aLong = valLong1.orElse(null);

    Assertions.assertThat(aLong).isEqualTo(1L);

  }

}
