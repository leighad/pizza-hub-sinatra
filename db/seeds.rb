#### CREATE USERS
kiki = User.create(user_name: "pizzagirl415", email: "girl415@pizza.com", password: "eatp1zza")
luigi = User.create(user_name: "pizzaguy510", email: "dude510@pizza.com", password: "i8pizza")

#### CREATE PIZZAS
Pizza.create(pizza_name: "My favorite", origin: "Arizmendi", price: "24", user_id: kiki.id)
Pizza.create(pizza_name: "Meat lover", origin: "Zachary's", price: "26", user_id: luigi.id)

#uses ActiveRecord to 'pre-associate'
kiki.pizzas.create(pizza_name: "Cheese from the freezer", origin: "Home", price: "4")
luigi.pizzas.create(pizza_name: "Home-made original", origin: "Home", price: "8")

#### CREATE INGREDIENTS
Ingredient.create(ingredient_name: "corn", amount: "extra", pizza_id: 1)
Ingredient.create(ingredient_name: "poblano", amount: "average", pizza_id: 1)
Ingredient.create(ingredient_name: "sauce", amount: "average", pizza_id: 3)
Ingredient.create(ingredient_name: "cheese", amount: "average", pizza_id: 3)

Ingredient.create(ingredient_name: "pepperoni", amount: "extra", pizza_id: 2)
Ingredient.create(ingredient_name: "chorizo", amount: "light", pizza_id: 2)
Ingredient.create(ingredient_name: "fresh mozzarella", amount: "light", pizza_id: 4)
Ingredient.create(ingredient_name: "cornmeal crust", amount: "average", pizza_id: 4)

