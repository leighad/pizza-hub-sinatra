
User.create(user_name: "pizzagirl415" email: "girl415@pizza.com" password: "1eatp1zza")
User.create(user_name: "pizzaguy510" email: "dude510@pizza.com" password: "8pizzanow")

Pizza.create(pizza_name: "My favorite" origin: "Arizmendi" price: "24" user_id: 1)
Pizza.create(pizza_name: "Cheese from the freezer" origin: "Home" price: "4" user_id: 1)
Pizza.create(pizza_name: "Meat lover" origin: "Zachary's" price: "26" user_id: 2)
Pizza.create(pizza_name: "Home-made original" origin: "Home" price: "8" user_id: 2)

Ingredients.create(ingredient_name: "corn" amount: "extra" pizza_id: 1)
Ingredients.create(ingredient_name: "poblano" amount: "average" pizza_id: 1)
Ingredients.create(ingredient_name: "sauce" amount: "average" pizza_id: 2)
Ingredients.create(ingredient_name: "cheese" amount: "average" pizza_id: 2)
Ingredients.create(ingredient_name: "pepperoni" amount: "extra" pizza_id: 3)
Ingredients.create(ingredient_name: "chorizo" amount: "light" pizza_id: 3)
Ingredients.create(ingredient_name: "fresh mozzarella" amount: "light" pizza_id: 4)
Ingredients.create(ingredient_name: "cornmeal crust" amount: "average" pizza_id: 4)

