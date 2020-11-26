List<Map> shoppingCart = [];

class ShoppingCart_services {
  static String valorTotal = " ";
  static int total = 0;

  static String getvalorTotal() {
    total = 0;
    for (int i = 0; i < shoppingCart.length; i++) {
      int pre = int.parse("${shoppingCart[i]['precio']}");
      total += pre;
    }
    ShoppingCart_services.valorTotal = total.toString();
  }
}
