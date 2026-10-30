package tts;

public class TTSRecursionImpl {

  private Node root;

  public void insert(String word) {

    this.root = insert(this.root, word, 0);

  }

  /** Can be optimized for performance*/
  private Node insert(Node node, String word, int index) {

    if (index == word.length()) {
     return node;
    }

    int currentCharacter = word.charAt(index);
    if (node == null) {
      node = new Node(currentCharacter);
    }

    if (currentCharacter == node.getCharacter()) {
      node.setMiddle(insert(node.getMiddle(), word, index + 1));
    } else if (currentCharacter < node.getCharacter()) {
      node.setLeft(insert(node.getLeft(), word, index));
    } else {
      node.setRight(insert(node.getRight(), word, index));
    }

    if (index == word.length() - 1) {
      node.setLeaf(true);
    }

    return node;
  }

}
