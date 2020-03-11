#App Overview
    I am building a pizza collector app called Pizza Hub where a user can create pizzas and store them in a collection.

#User Stories
    Users will be able to:
    -sign up, log in, log out

    Users can:
    -create a pizza
    -see their personal pizza collection
    -edit a pizza
    -delete a pizza

#Wireframing (attributes and associations)
    Models will be:
    User, Pizza, Ingredients

    User attributes:
    user_name
    email
    password (with bcrypt will be password_digest in db)

    User associations:
    has_secure_password
    has_many :pizzas

    Pizza attributes:
    pizza_name
    origin
    price
    user_id

    Pizza associations:
    has_many :ingredients
    belongs_to :user

    Ingredients attributes:
    ingredient_name
    amount
    pizza_id

    Ingredients associations:
    belongs_to :pizza

#MVP
    *see spec.md file for checklist*

#Stretch Goals
    -style nicely with CSS
    -add beer pairing feature


