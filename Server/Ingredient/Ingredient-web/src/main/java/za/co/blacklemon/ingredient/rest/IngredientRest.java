package za.co.blacklemon.ingredient.rest;

import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;
import org.apache.log4j.Logger;
import za.co.blacklemon.ingredient.dao.IIngredientDao;
import za.co.blacklemon.ingredient.model.IngredientCategory;
import za.co.blacklemon.ingredient.model.RecipeCategory;
import za.co.blacklemon.ingredient.model.Supplier;

/**
 * REST Web Service
 *
 * @author sean
 */
@Path("rest")
public class IngredientRest {

   @Context
   private UriInfo context;
   private Logger log = Logger.getLogger(IngredientRest.class);

   @EJB
   private IIngredientDao ingredientDao;

   public IngredientRest() {
   }

   @GET
   @Produces(MediaType.APPLICATION_JSON)
   @Path("/ingredientCategories")
   public List<IngredientCategory> getIngredientCategories() {
      log.info("getIngredientCategories");
      return ingredientDao.getIngredientCategories();
   }

   @GET
   @Produces(MediaType.APPLICATION_JSON)
   @Path("/recipeCategories")
   public List<RecipeCategory> getRecipeCategories() {
      log.info("getRecipeCategories");
      return ingredientDao.getRecipeCategories();
   }

   @GET
   @Produces(MediaType.APPLICATION_JSON)
   @Path("/suppliers")
   public List<Supplier> getSuppliers() {
      log.info("getSuppliers");
      return ingredientDao.getSuppliers();
   }

   @GET
   @Produces("text/plain")
   @Path("/test")
   public String test() {
      log.info("test");
      return "this is a service";
   }
}
