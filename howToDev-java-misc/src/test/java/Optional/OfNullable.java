package Optional;

import java.util.Optional;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

public class OfNullable {

  @Test
  public void ofNullableAndMapAndOrElse_nonNull() {

    Long valLong = 0L;
    String valString = Optional
        .ofNullable(valLong)
        .map(String::valueOf)
        .orElse(null);

    Assertions.assertThat(valString).isEqualTo("0");

  }

  @Test
  public void ofNullableAndMapAndOrElse_null() {

    Long valLong = null;

    String valString = Optional
        .ofNullable(valLong)
        .map(String::valueOf)
        .orElse(null);

    Assertions.assertThat(valString).isEqualTo(null);

  }

  @Test
  public void ofNullable_null() {

    Long valLong = null;

    Optional<Long> valLong1 = Optional.ofNullable(valLong);

    Assertions.assertThat(valLong1).isEmpty();
    Assertions.assertThat(valLong1).isNotPresent();

  }

  @Test
  public void ofNullableAndMap_null() {

    Long valLong = null;

    Optional<Long> valLongOptional = Optional.ofNullable(valLong);
    Optional<String> valStringOptional = valLongOptional.map(String::valueOf);

    Assertions.assertThat(valStringOptional).isEmpty();

  }

}
