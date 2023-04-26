package collect.groupingBy;

import java.util.List;
import java.util.stream.Collectors;
import org.example.model.Author;
import org.junit.jupiter.api.Test;

public class FlatMappingTest {

  @Test
  void flatMapping(){

    Author author1 = new Author("Ivo", List.of("Geeks","for","Geeks"));
    Author author2 = new Author("Ivo", List.of("Geeks9","for","Geeks"));
    Author author3 = new Author("Pepi", List.of("Geeks9","for","Geeks"));

    List<Author> authors =  List.of(author1, author2, author3);

    Object collect = authors.stream().collect(
        Collectors.groupingBy(Author::getName,
            Collectors.flatMapping(el -> el.getComments().stream(),Collectors.toList() ))
    );

    System.out.println(collect.toString());

  }
}
