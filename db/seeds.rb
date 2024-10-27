# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
p1=Page.create(title: "Blog sur les oiseaux", content: "Tout savoir sur les oiseaux")
p2=Page.create(title: "Blog sur les reptiles", content: "Tout savoir sur les reptiles")
Post.create([{title: "Mon premier post", body: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", page: p1},{title: "Mon deuxieme post", body: "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", page: p1},{title: "Mon troisieme post", body: "cccccccccccccccccccccccccccccccccccccccc", page: p1}])
Post.create([{title: "Mon quatrieme post", body: "zzzzzzzzzzzzzzzzzzzzzzzz", page: p2},{title: "Mon cinquieme post", body: "xxxxxxxxxxxxxxxxxxxxxxxxx", page: p2},{title: "Mon sizieme post", body: "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy", page: p2}])