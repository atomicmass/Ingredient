package za.co.blacklemon.ingredient.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 */
@Entity
@NamedQueries({
   @NamedQuery(name="getAllIngredientCategories", query="select i from IngredientCategory i")
})
@XmlRootElement
public class IngredientCategory implements Serializable {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private Long id;
   @Column
   private String name;
   @Column
   private String imageURL;

   public IngredientCategory() {}

   public Long getId() {
      return id;
   }

   public void setId(Long id) {
      this.id = id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getImageURL() {
      return imageURL;
   }

   public void setImageURL(String imageURL) {
      this.imageURL = imageURL;
   }
}
