arrAssort = ["áo","Quần","Bộ","Đầy đủ"]
arrAssort.each do |as|
  name = as
  Assort.create!(name:  name)
end

arrTrademark = ["other","Louis Vuitton","Chanel","Prada","Dior","Hermes","Burberry","Gucci","Versace","Dolce & Gabbana","Armani"]
arrTrademark.each do |at|
  name = at
  Trademark.create!(name:  name)
end

Admin.create!(username:  "admin",
 password: "1")

5.times do |n|
  name  = Faker::Name.name
  Typenew.create!(
    name:name
    )
end

10.times do |n|
  username = "user#{n+1}"
  password = "1"
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  phone = "0199999999"
  User.create!(
    username: username,
    password: password,
    name:  name,
    email: email,
    phone: phone)
end

20.times do |n|
  ass_id  = 1
  tra_id  = 1
  name  = Faker::Name.name
  img_detail = "https://images-eu.ssl-images-amazon.com/images/I/51U9AUB2viL._AC_UL260_SR200,260_FMwebp_QL70_.jpg"
  content = "content nnnnnnn"
  price = 5.5
  status = 1
  keys = "#giay, #dep"
  star = 3.5
  Product.create!(
    assort_id: ass_id,
    trademark_id: tra_id,
    name:  name,
    img_detail: img_detail,
    content: content,
    price: price,
    status: status,
    keys: keys,
    star: star)
end

