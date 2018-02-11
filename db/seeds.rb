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
  username: "adminpro",
  password: "adminpro",
  name:  "my admin",
  email: "admin1234@gmail.com",
  phone: "01888888888",
  role: 0,
  admin: true,
  img_thumb: "/assets/user.png"
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
  email = "example#{n+1}@railstutorial.org"
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

50.times do |n|
  ass_id  = 1
  tra_id  = 1
  name  = Faker::Name.name
  img_detail = "/assets/ao.png"
  content = "content nnnnnnn"
  price = Random.rand(1...100)
  status = 1
  keys = "#giay, #dep"

  Product.create!(
    assort_id: ass_id,
    trademark_id: tra_id,
    name:  name,
    img_detail: img_detail,
    content: content,
    price: price,
    status: status,
    keys: keys,
    count: 10)
end

99.times do |n|
  user_id = n/10.to_i
  product_id = n%10.to_i
  if user_id == 0
    user_id = 10
  end
  if product_id == 0
    product_id = 10
  end

  reply = 0

  Comment.create!(
    user_id: user_id,
    product_id: product_id,
    comment:  "My name is #{Faker::Name.name} i'm #{Faker::Number.number(2)} my company is #{Faker::Company.name}",
    time_cmt: Time.now,
    reply: reply
    )
end

99.times do |n|
  user_id = n/10.to_i
  product_id = n%10.to_i
  if user_id == 0
    user_id = 10
  end
  if product_id == 0
    product_id = 10
  end

  Rate.create!(
    user_id: user_id,
    product_id: product_id,
    rate: Random.rand(1...5)
    )
end

arrTitle = ["quis porta tellus dictum","an introduction by Michael McNay","Observer style guide Guardian and Observer style guide"]

arrImg = ["https://images.pexels.com/photos/6384/woman-hand-desk-office.jpg?w=940&h=650&auto=compress&cs=tinysrgb",
  "https://images.pexels.com/photos/374897/pexels-photo-374897.jpeg?w=940&h=650&auto=compress&cs=tinysrgb",
  "https://images.pexels.com/photos/541522/pexels-photo-541522.jpeg?w=940&h=650&auto=compress&cs=tinysrgb",
  "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2015/5/22/1432299215355/baff131f-a335-44eb-ad66-03c52c5c2213-620x372.jpeg?w=700&q=85&auto=format&sharp=10&s=31a22f00a85840740c2a8af5604abfb0",
  "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2015/9/11/1441964447628/5f03adcd-3947-4aec-ba42-8d9365fcf755-620x615.jpeg?w=700&q=85&auto=format&sharp=10&s=661551e4de042aee3003bca57aca876c",
  "https://i.guim.co.uk/img/media/ef4a19c1582b9feb6c49e7f6d783aa234dc3c60c/0_0_2480_1487/master/2480.jpg?w=700&q=85&auto=format&sharp=10&s=a7485a359c5c19e89d7f0e8f71b31c8c",
  "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2015/8/20/1440084421494/658509dc-71ec-4329-a44a-65a8968f31eb-2060x1236.jpeg?w=700&q=85&auto=format&sharp=10&s=95d11c21789512a206c58f6e09161c3b",
  "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2015/9/1/1441111760813/babad85b-8749-43dd-8b0a-dda57f7de279-2060x1236.jpeg?w=700&q=85&auto=format&sharp=10&s=943b47a6776b1ecbfb4c6db7d8932d45",
  "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2015/8/18/1439900836746/9e43bef2-d7c7-4a97-a1bc-93636ce361a7-620x372.jpeg?w=620&q=85&auto=format&sharp=10&s=7f9bd5cd72f68f040252a9dca512778c"]

21.times do |n|
  New.create!(
    typenew_id: Random.rand(1...5),
    title: arrTitle.sample,
    description: "Phasellus lorem enim, luctus ut velit eget, convallis egestas eros. Sed ornare ligula eget tortor tempor, quis porta tellus dictum",
    img_thumb: arrImg.sample,
    content: "Phasellus lorem enim, luctus ut velit eget, convallis egestas eros. Sed ornare ligula eget tortor tempor, quis porta tellus dictum",
    day_create: Time.now
    )
end

Comment.where(:id => [40, 50, 60]).update_all(:reply => 10)
Comment.where(:id => [70, 80]).update_all(:reply => 20)
Comment.where(:id => [90]).update_all(:reply => 30)

Comment.where(:id => [81, 91, 31]).update_all(:reply => 1)
Comment.where(:id => [41, 51]).update_all(:reply => 11)
Comment.where(:id => [61, 71]).update_all(:reply => 21)

Comment.where(:id => [32, 42, 52]).update_all(:reply => 2)
Comment.where(:id => [62, 72]).update_all(:reply => 12)
Comment.where(:id => [82, 92]).update_all(:reply => 22)
Comment.where(:id => 52).update(:user_id => 10)

Comment.where(:id => [43, 53]).update_all(:reply => 3)
Comment.where(:id => [63, 73]).update_all(:reply => 13)
Comment.where(:id => [83, 93]).update_all(:reply => 23)

Comment.where(:id => [44, 54]).update_all(:reply => 4)
Comment.where(:id => [34, 64, 74]).update_all(:reply => 14)
Comment.where(:id => [84, 94]).update_all(:reply => 24)

Comment.where(:id => [45, 55]).update_all(:reply => 5)
Comment.where(:id => [35, 65]).update_all(:reply => 15)
Comment.where(:id => [85, 95, 75]).update_all(:reply => 25)

Comment.where(:id => [46, 56]).update_all(:reply => 6)
Comment.where(:id => [36, 66]).update_all(:reply => 16)
Comment.where(:id => [86, 96, 76]).update_all(:reply => 26)

Comment.where(:id => [47, 57]).update_all(:reply => 7)
Comment.where(:id => [37, 67]).update_all(:reply => 17)
Comment.where(:id => [87, 97, 77]).update_all(:reply => 27)

Comment.where(:id => [48, 58]).update_all(:reply => 8)
Comment.where(:id => [38, 68]).update_all(:reply => 18)
Comment.where(:id => [88, 98, 78]).update_all(:reply => 28)

Comment.where(:id => [49, 59]).update_all(:reply => 9)
Comment.where(:id => [39, 65]).update_all(:reply => 19)
Comment.where(:id => [89, 99, 79]).update_all(:reply => 29)
