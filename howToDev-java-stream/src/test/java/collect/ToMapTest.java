package collect;

import static org.junit.jupiter.api.Assertions.assertThrows;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.assertj.core.api.Assertions;
import org.example.model.Author;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

public class ToMapTest {

  @Test
  @Tag("simple")
  public void toMap() {

    /**
     Function.identity() is the same as x -> x
     */

    Author author1 = new Author("Ivo", List.of("Geeks", "for", "Geeks"), "favoriteComment");
    Author author2 = new Author("Gogo", List.of("Geeks9", "for", "Geeks"));
    Author author3 = new Author("Pepi", List.of("Geeks9", "for", "Geeks"));

    List<Author> authors = List.of(author1, author2, author3);

    Map<String, String> collectToMap = authors.stream().collect(Collectors.toMap(Author::getName, Author::getFavoriteComment));

    System.out.println(collectToMap);


  }

  @Test
  @Tag("Function.identity")
  public void toMap_Function_identity() {

    /**
     Function.identity() is the same as x -> x
     */

    Author author1 = new Author("Ivo", List.of("Geeks", "for", "Geeks"));
    Author author2 = new Author("Gogo", List.of("Geeks9", "for", "Geeks"));
    Author author3 = new Author("Pepi", List.of("Geeks9", "for", "Geeks"));

    List<Author> authors = List.of(author1, author2, author3);

    Map<String, Author> collectToMap = authors.stream().collect(Collectors.toMap(Author::getName, Function.identity()));
    Map<String, Author> collectToMap1 = authors.stream().collect(Collectors.toMap(Author::getName, x -> x));

    System.out.println(collectToMap);
    System.out.println(collectToMap1);

  }


  @Test
  @Tag("mergeFunction")
  public void toMap_mergeFunction() {

    Author author1 = new Author("Ivo", List.of("Geeks", "for", "Geeks"), "favorComment1");
    Author author2 = new Author("Ivo", List.of("Geeks9", "for", "Geeks"), "favorComment2");
    Author author3 = new Author("Pepi", List.of("Geeks9", "for", "Geeks"), "favorComment3");

    List<Author> authors = List.of(author1, author2, author3);

    Map<String, String> collectWithMerge = authors.stream().collect(Collectors.toMap(Author::getName, Author::getFavoriteComment,
        (old_, new_) -> {
          System.out.println(String.format("Duplication for some key: %s and %s", old_, new_));
          return old_;

        }));

    System.out.println(collectWithMerge);

  }

  @Test
  @Tag("mergeFunctionAndMapFactory")
  public void toMap_mergeFunctionAndMapFactory() {

    Author author1 = new Author("Ivo", List.of("Geeks", "for", "Geeks"), "favorComment1");
    Author author2 = new Author("Ivo", List.of("Geeks9", "for", "Geeks"), "favorComment2");
    Author author3 = new Author("Pepi", List.of("Geeks9", "for", "Geeks"), "favorComment3");

    List<Author> authors = List.of(author1, author2, author3);

    Map<String, String> collectWithMerge = authors.stream().collect(Collectors.toMap(Author::getName, Author::getFavoriteComment,
        (old_, new_) -> {
          System.out.println(String.format("Duplication for some key: %s and %s", old_, new_));
          return old_;
        }, () -> new TreeMap<>()));

    Assertions.assertThat(collectWithMerge).isInstanceOf(TreeMap.class);

  }

  @Test()
  @Tag("withOutMergeFunction")
  public void toMap_givenDublicateName_whenToMapWithOutMergeFunction_thenThrowIllegalStateException() {

    /**
     * Because in the list there are two "Ivo"
     * */

    Author author1 = new Author("Ivo", List.of("Geeks", "for", "Geeks"), "favorComment1");
    Author author2 = new Author("Ivo", List.of("Geeks9", "for", "Geeks"), "favorComment2");
    Author author3 = new Author("Pepi", List.of("Geeks9", "for", "Geeks"), "favorComment3");

    List<Author> authors = List.of(author1, author2, author3);

    assertThrows(IllegalStateException.class, () -> authors.stream().collect(Collectors.toMap(Author::getName,
        Author::getFavoriteComment)));

  }


}
