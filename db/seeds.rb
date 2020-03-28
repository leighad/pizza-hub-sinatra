#### CREATE USERS
kiki = User.create(user_name: "pizzagirl415", email: "girl415@pizza.com", password: "eatp1zza")
luigi = User.create(user_name: "pizzaguy510", email: "dude510@pizza.com", password: "i8pizza")

#### CREATE PIZZAS
Pizza.create(pizza_name: "My favorite", origin: "Arizmendi", price: "24", description: "corn and poblano peppers with lime cilantro sauce", notes: "seasonal", user_id: kiki.id)
Pizza.create(pizza_name: "Meat lover", origin: "Zachary's", price: "26", description: "pepperoni, sausage, chorizo, and more", notes: "kiki doesn't like it", user_id: luigi.id)

#uses ActiveRecord to 'pre-associate'
kiki.pizzas.create(pizza_name: "Cheese from the freezer", origin: "Home", price: "4", description: "thin and crispy", notes: "really just serves one")
luigi.pizzas.create(pizza_name: "Home-made original", origin: "Home", price: "8", description: "best with garlic sauce, white cheddar and broccoli", notes: "the dough must be made in advance")

#### CREATE INGREDIENTS
Ingredient.create(ingredient_name: "corn", amount: "extra", pizza_id: 1)
Ingredient.create(ingredient_name: "poblano", amount: "average", pizza_id: 1)
Ingredient.create(ingredient_name: "sauce", amount: "average", pizza_id: 3)
Ingredient.create(ingredient_name: "cheese", amount: "average", pizza_id: 3)

Ingredient.create(ingredient_name: "pepperoni", amount: "extra", pizza_id: 2)
Ingredient.create(ingredient_name: "chorizo", amount: "light", pizza_id: 2)
Ingredient.create(ingredient_name: "fresh mozzarella", amount: "light", pizza_id: 4)
Ingredient.create(ingredient_name: "cornmeal crust", amount: "average", pizza_id: 4)

#####NOTE:
# description and notes info added to create pizzas but db not updated yet...