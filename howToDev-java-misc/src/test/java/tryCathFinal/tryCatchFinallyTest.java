package tryCathFinal;


import org.example.tryCatchFinal.tryCatchFinally;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class tryCatchFinallyTest {

  @Test
  void givenHelper_whenDo_thenReturnValueFromFinally() {

    tryCatchFinally tryCatchFinallyHelper = new tryCatchFinally();

    Assertions.assertEquals(5,tryCatchFinallyHelper.returnFromFinallyIsWrong(5));

  }
}
