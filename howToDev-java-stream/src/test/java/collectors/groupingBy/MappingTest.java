package collectors.groupingBy;

import java.util.List;
import java.util.stream.Collectors;
import org.example.model.Author;
import org.junit.jupiter.api.Test;

public class MappingTest {

  @Test
  void flatMapping(){
    //# Collectors.flatMapping - if we have Collection property

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

  @Test
  void mapping(){
    //# Collectors.mapping - if we have only single property

    Author author1 = new Author("Ivo", List.of("Geeks","for","Geeks"));
    Author author2 = new Author("Ivo", List.of("Geeks9","for","Geeks"));
    Author author3 = new Author("Pepi", List.of("Geeks9","for","Geeks"));

    List<Author> authors =  List.of(author1, author2, author3);

    Object collect = authors.stream().collect(
        Collectors.groupingBy(Author::getName,
            Collectors.mapping(Author::getFavoriteComment,Collectors.toList() ))
    );

    System.out.println(collect.toString());

  }


}
