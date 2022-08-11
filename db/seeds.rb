# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
UserInfoCategory.create([{type_name: "何者か"},{type_name: "何をするのか？"},{type_name: "大まかな性格・癖"},{type_name: "口調・語尾の特徴"},{type_name: "何が好きか"},{type_name: "何が嫌いか"}])
AngleCategory.create([{name: "頭"},{name: "上半身"},{name: "下半身"},{name: "前"},{name: "後"},{name: "上"},{name: "下"},{name: "右"},{name: "左"}])