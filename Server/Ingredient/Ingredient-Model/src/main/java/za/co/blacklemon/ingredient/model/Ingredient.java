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
   @NamedQuery(name="getAllIngredients", query="select i from Ingredient i")
})
@XmlRootElement
public class Ingredient implements Serializable {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private Long id;
   @Column
   private String name;
   @Column
   private String imageURL;
   @Column
   private String description;

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

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

}
