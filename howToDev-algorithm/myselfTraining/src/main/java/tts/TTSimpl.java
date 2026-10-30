package tts;

import lombok.AllArgsConstructor;


public class TTSimpl extends Node {

  TTSimpl() {

    super();
  }

  public void insert_bak(String word) {

    Node parentNode = null;
    int currentIndex = 0;
    int currentCharacter = word.charAt(0) - 97;

    if (getCharacter() == null) {
      this.setCharacter(currentCharacter);
      parentNode = this;
      currentIndex++;
    }
    else if (currentCharacter == getCharacter()) {
      parentNode = this;
      currentIndex++;
    }
    else if (currentCharacter > getCharacter()) {
      if (getRight() == null) {
        Node rightNode = new Node();
        rightNode.setCharacter(currentCharacter);
        setRight(rightNode);
        currentIndex++;
      }
      parentNode = getRight();
    }
    else if (currentCharacter < getCharacter()) {
      if (getLeft() == null) {
        Node leftNode = new Node();
        leftNode.setCharacter(currentCharacter);
        setLeft(leftNode);
        currentIndex++;
      }
      parentNode = getLeft();
    }

    String debugger = "";
    /// /////
    for (int i = 1; i < word.length(); i++) {
      currentCharacter = word.charAt(currentIndex) - 97;

      if (parentNode.getLeft() == null && parentNode.getMiddle() == null && parentNode.getRight() == null) {

        Node middleNode = new Node();
        middleNode.setCharacter(currentCharacter);
        parentNode.setMiddle(middleNode);
        parentNode = middleNode;
        currentIndex++;
      }
      else if (parentNode.getMiddle() != null && currentCharacter == parentNode.getMiddle().getCharacter()) {
        parentNode = parentNode.getMiddle();
        currentIndex++;
      }
      else if (currentCharacter > parentNode.getCharacter()) {
        if (parentNode.getRight() == null) {
          Node rightNode = new Node();
          rightNode.setCharacter(currentCharacter);
        }

        parentNode = parentNode.getMiddle() != null ? parentNode.getMiddle() : parentNode.getRight();

        parentNode = parentNode.getRight();
      }
      else if (currentCharacter < parentNode.getCharacter()) {
        if (parentNode.getLeft() == null) {
          Node leftNode = new Node();
          leftNode.setCharacter(currentCharacter);
          parentNode.setLeft(leftNode);
        }
        parentNode = parentNode.getLeft();
      }
    }

    parentNode.setLeaf(true);

  }

  public void insert(String word) {

    Node tempNode = this;
    int currentIndex = 0;
    int currentCharacter = word.charAt(0) - 97;
    if (getLeft() == null && getMiddle() == null && getRight() == null) {
      tempNode.setCharacter(currentCharacter);
//      Node newMiddle = new Node();
//      tempNode.setMiddle(newMiddle);
//      tempNode = newMiddle;
      currentIndex++;
    }
    else if (currentCharacter == tempNode.getCharacter()) {
      tempNode = tempNode.getMiddle();
      currentIndex++;
    }
    else if (currentCharacter > tempNode.getCharacter()) {
      if (tempNode.getRight() == null) {
        Node newRight = new Node();
        newRight.setCharacter(currentCharacter);
        tempNode.setRight(newRight);
        tempNode = newRight;
        currentIndex++;
      }
      else {
        tempNode = tempNode.getRight();
      }
    }
    else {
      if (tempNode.getLeft() == null) {
        Node newLeft = new Node();
        newLeft.setCharacter(currentCharacter);
        tempNode.setLeft(newLeft);
        tempNode = newLeft;
        currentIndex++;
      }
      else {
        tempNode = tempNode.getRight();
      }
    }

    while (currentIndex < word.length()) {

      currentCharacter = word.charAt(currentIndex) - 97;

      if (tempNode.getLeft() == null && tempNode.getMiddle() == null && tempNode.getRight() == null) {
        //tempNode.setCharacter(currentCharacter);
        // if (i < word.length() - 1) {
        Node newMiddle = new Node();
        newMiddle.setCharacter(currentCharacter);
        tempNode.setMiddle(newMiddle);
        tempNode = newMiddle;
        // }
        currentIndex++;
      }
      else if (currentCharacter == tempNode.getCharacter()) {
        tempNode = tempNode.getMiddle();
        currentIndex++;
      }
      else if (currentCharacter > tempNode.getCharacter()) {

        if (tempNode.getRight() == null) {
          Node newRight = new Node();
          newRight.setCharacter(currentCharacter);
          tempNode.setRight(newRight);
          tempNode = newRight;
          currentIndex++;
        }
        else {
          tempNode = tempNode.getRight();
        }
      }
      else {
        if (tempNode.getLeft() == null) {
          Node newLeft = new Node();
          newLeft.setCharacter(currentCharacter);
          tempNode.setLeft(newLeft);
          tempNode = newLeft;
          currentIndex++;
        }
        else {
          tempNode = tempNode.getRight();
        }
      }

    }

    tempNode.setLeaf(true);
    String debugger = "";

  }
}
