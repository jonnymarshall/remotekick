# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

require_relative "./city_specific_seeds/melbourne_seeds.rb"
require_relative "./city_specific_seeds/chiang_mai_seeds.rb"
require_relative "./user_seeds/user_seeds.rb"

#----------CLEAN DB----------
# puts 'Cleaning database...'
# Review.destroy_all
# CoffeeShop.destroy_all
# User.destroy_all

#----------USER SEEDS----------
# create_user_seeds

#----------COFFEE SHOP SEEDS----------
#CHIANG MAI
# create_chiang_mai_coffee_shops
# create_chiang_mai_coffee_shop_reviews

# MELBOURE
# create_melbourne_coffee_shops(melbourne_coffee_shop_attributes)
create_melbourne_coffee_shop_reviews(melbourne_coffee_shop_attributes, melbourne_coffee_shop_review_attributes)

#----------CLOUDINARY IMAGE SEEDS----------
# url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# article = Article.new(title: 'NES', body: "A great console")
# article.remote_photo_url = url
# article.save
