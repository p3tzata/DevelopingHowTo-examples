package org.example.tryCatchFinal;

import java.time.ZonedDateTime;

public class tryCatchFinally {
  public int returnFromFinallyIsWrong(int returnFromFinally) {

    int result = 0;
    ZonedDateTime time=null;

    try {
      time.getHour();
    } catch (NullPointerException exception) {
      result = returnFromFinally;
    }
    //Return must be outside finally
    return result;

  }

}
