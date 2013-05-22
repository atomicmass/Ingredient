package za.co.blacklemon.ingredient.dao;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import za.co.blacklemon.ingredient.model.IngredientCategory;
import za.co.blacklemon.ingredient.model.RecipeCategory;
import za.co.blacklemon.ingredient.model.Supplier;

/**
 *
 */
@Stateless
public class IngredientDao implements IIngredientDao {

   @PersistenceContext(unitName = "puOpenJPA_MSSQL", type = PersistenceContextType.TRANSACTION)
   private EntityManager entityManager;

   public List<IngredientCategory> getIngredientCategories() {
      return entityManager.createNamedQuery("getAllIngredientCategories").getResultList();
   }

   public List<RecipeCategory> getRecipeCategories() {
      return entityManager.createNamedQuery("getAllRecipeCategories").getResultList();
   }

   public List<Supplier> getSuppliers() {
      return entityManager.createNamedQuery("getAllSuppliers").getResultList();
   }

}
