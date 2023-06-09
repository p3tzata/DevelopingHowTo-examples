package ZoneDateTime;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import org.junit.jupiter.api.Test;

public class ZoneDateTimeTest {

   @Test
   void withZoneSameInstant(){

     ZonedDateTime now = ZonedDateTime.now().minusHours(14);
     //#ZonedDateTime withZoneSameInstant
     /**
      * Returns a copy of this date-time with a different time-zone, retaining the instant.
      *
      * This method is particularly useful when you need to work with dates and times across different time zones,
      * while maintaining the consistency of the actual point in time.
      * */
     ZonedDateTime nowWithDifferentZone = now.withZoneSameInstant(ZoneId.of("UTC"));

     System.out.println(now);
     System.out.println(nowWithDifferentZone);

   }

}
