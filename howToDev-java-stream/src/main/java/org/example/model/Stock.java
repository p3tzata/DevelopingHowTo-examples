package org.example.model;

public class Stock {

  private String articleNo;
  private int qtty;
  private String uom;

  @Override
  public String toString() {

    return "Stock{" +
        "articleNo='" + articleNo + '\'' +
        ", qtty=" + qtty +
        ", uom='" + uom + '\'' +
        '}';
  }

  public Stock(String articleNo, int qtty, String uom) {
    this.articleNo = articleNo;
    this.qtty = qtty;
    this.uom = uom;
  }

  public String getArticleNo() {

    return articleNo;
  }

  public void setArticleNo(String articleNo) {

    this.articleNo = articleNo;
  }

  public int getQtty() {

    return qtty;
  }

  public void setQtty(int qtty) {

    this.qtty = qtty;
  }

  public String getUom() {

    return uom;
  }

  public void setUom(String uom) {

    this.uom = uom;
  }
}
