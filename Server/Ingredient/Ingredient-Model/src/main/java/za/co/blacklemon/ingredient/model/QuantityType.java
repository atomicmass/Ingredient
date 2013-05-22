package za.co.blacklemon.ingredient.model;

/**
 *
 */
public enum QuantityType {
   Units("units"),
   Grams("grams"),
   Millilitres("millilitres");

   private String type;

   private QuantityType(String type) {
      this.type = type;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

}
