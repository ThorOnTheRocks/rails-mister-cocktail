module CocktailsHelper
    
        def cocktail_image_path(cocktail)
          if @cocktail.photo.attached?
            cl_image_path(@cocktail.photo.key)
          else
            # cl_image_path('cocktail_placeholder')
            asset_path('cocktail_placeholder.jpg')
          end
        end
     
end
