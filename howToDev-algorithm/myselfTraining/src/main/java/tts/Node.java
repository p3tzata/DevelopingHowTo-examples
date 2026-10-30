package tts;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Node {

  private Integer character;
  private Node left;
  private Node middle;
  private Node right;
  private boolean isLeaf;

  public Node(Integer character) {
    this.character = character;
  }

  public Node() {}
}
