package za.co.blacklemon.ingredient;

import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

/**
 *
 */
@Stateless
@Path("/ingredient/")
public class IngredientRest {
   @GET
   @Produces("text/html")
   public String getTest() {
      return "Hello";
   }

}
