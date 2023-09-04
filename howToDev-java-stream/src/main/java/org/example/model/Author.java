package org.example.model;

import java.util.List;
import java.util.Objects;

public class Author {

  String name;
  List<String> comments;
  String favoriteComment;

  public Author(String name, List<String> comments) {

    this(name, comments, "noFavoriteComment");

  }

  public Author(String name, List<String> comments, String favoriteComment) {

    this.name = name;
    this.comments = comments;
    this.favoriteComment = favoriteComment;
  }


  public String getFavoriteComment() {

    return favoriteComment;
  }

  public String getName() {

    return name;
  }

  public List<String> getComments() {

    return comments;
  }

  @Override
  public boolean equals(Object o) {

    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Author author = (Author) o;
    return Objects.equals(name, author.name);
  }

  @Override
  public int hashCode() {

    return Objects.hash(name);
  }

  @Override
  public String toString() {

    return "Author{" +
        "name='" + name + '\'' +
        ", comments=" + comments +
        ", favoriteComment='" + favoriteComment + '\'' +
        '}';
  }
}
