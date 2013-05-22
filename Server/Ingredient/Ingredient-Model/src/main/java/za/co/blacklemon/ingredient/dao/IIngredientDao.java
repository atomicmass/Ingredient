package za.co.blacklemon.ingredient.dao;

import java.util.List;
import javax.ejb.Remote;
import za.co.blacklemon.ingredient.model.IngredientCategory;
import za.co.blacklemon.ingredient.model.RecipeCategory;
import za.co.blacklemon.ingredient.model.Supplier;

/**
 *
 */
@Remote
public interface IIngredientDao {
   public List<IngredientCategory> getIngredientCategories();
   public List<RecipeCategory> getRecipeCategories();
   public List<Supplier> getSuppliers();
}
