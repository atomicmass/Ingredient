package za.co.blacklemon.ingredient.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 */
@Entity
@NamedQueries({
   @NamedQuery(name="getAllRecipeIngredients", query="select i from RecipeIngredient i")
})
@XmlRootElement
public class RecipeIngredient extends Ingredient implements Serializable {

}
