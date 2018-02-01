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

User.create!(
  username: "admin",
  password: "1",
  name:  "my admin",
  email: "admin1234@gmail.com",
  phone: "01888888888",
  role: 0
  )

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
    phone: phone,
    role: 1
    )
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

+99.times do |n|
+  user_id = n/10.to_i
+  product_id = n%10.to_i
+  if user_id == 0
+    user_id = 10
+  end
+  if product_id == 0
+    product_id = 10
+  end
+
+  reply = 0
+
+  Comment.create!(
+    user_id: user_id,
+    product_id: product_id,
+    comment:  "My name is #{Faker::Name.name} i'm #{Faker::Number.number(2)} my company is #{Faker::Company.name}",
+    time_cmt: Time.now,
+    reply: reply
+    )
+end
+
+99.times do |n|
+  user_id = n/10.to_i
+  product_id = n%10.to_i
+  if user_id == 0
+    user_id = 10
+  end
+  if product_id == 0
+    product_id = 10
+  end
+
+  Rate.create!(
+    user_id: user_id,
+    product_id: product_id,
+    rate: Random.rand(1...5)
+    )
+end
+
+Comment.where(:id => [40, 50, 60]).update_all(:reply => 10)
+Comment.where(:id => [70, 80]).update_all(:reply => 20)
+Comment.where(:id => [90]).update_all(:reply => 30)
+
+Comment.where(:id => [81, 91, 31]).update_all(:reply => 1)
+Comment.where(:id => [41, 51]).update_all(:reply => 11)
+Comment.where(:id => [61, 71]).update_all(:reply => 21)
+
+Comment.where(:id => [32, 42, 52]).update_all(:reply => 2)
+Comment.where(:id => [62, 72]).update_all(:reply => 12)
+Comment.where(:id => [82, 92]).update_all(:reply => 22)
+Comment.where(:id => 52).update(:user_id => 10)
+
+Comment.where(:id => [43, 53]).update_all(:reply => 3)
+Comment.where(:id => [63, 73]).update_all(:reply => 13)
+Comment.where(:id => [83, 93]).update_all(:reply => 23)
+
+Comment.where(:id => [44, 54]).update_all(:reply => 4)
+Comment.where(:id => [34, 64, 74]).update_all(:reply => 14)
+Comment.where(:id => [84, 94]).update_all(:reply => 24)
+
+Comment.where(:id => [45, 55]).update_all(:reply => 5)
+Comment.where(:id => [35, 65]).update_all(:reply => 15)
+Comment.where(:id => [85, 95, 75]).update_all(:reply => 25)
+
+Comment.where(:id => [46, 56]).update_all(:reply => 6)
+Comment.where(:id => [36, 66]).update_all(:reply => 16)
+Comment.where(:id => [86, 96, 76]).update_all(:reply => 26)
+
+Comment.where(:id => [47, 57]).update_all(:reply => 7)
+Comment.where(:id => [37, 67]).update_all(:reply => 17)
+Comment.where(:id => [87, 97, 77]).update_all(:reply => 27)
+
+Comment.where(:id => [48, 58]).update_all(:reply => 8)
+Comment.where(:id => [38, 68]).update_all(:reply => 18)
+Comment.where(:id => [88, 98, 78]).update_all(:reply => 28)
+
+Comment.where(:id => [49, 59]).update_all(:reply => 9)
+Comment.where(:id => [39, 65]).update_all(:reply => 19)
+Comment.where(:id => [89, 99, 79]).update_all(:reply => 29)
