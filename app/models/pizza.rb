class Pizza < ActiveRecord::Base
    has_many :ingredients
    belongs_to :user

    validates_presence_of :pizza_name
end


# t.string   "pizza_name"
# t.string   "price"
# t.integer  "user_id"
# t.datetime "created_at",  null: false
# t.datetime "updated_at",  null: false
# t.string   "origin"
# t.text     "description"
# t.text     "notes"