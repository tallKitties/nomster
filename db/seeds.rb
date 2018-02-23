User.create!([
  {email: "bkautt73@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2018-02-21 17:10:05", last_sign_in_at: "2018-02-21 04:58:36", current_sign_in_ip: "10.0.2.2", last_sign_in_ip: "10.0.2.2"}
])
Place.create!([
  {name: "Monterey Pizza & Asian Zap", description: "Amazing pizza and great service! They'll even make custom slices!", address: "599 Monterey Blvd, San Francisco, CA 94127", user_id: 1},
  {name: "Shanghai Dumpling King", description: "Best dumplings around with quick service!", address: "696 Monterey Blvd, San Francisco, CA 94127", user_id: 1},
  {name: "One Waan Thai", description: "Best thai around", address: "2922 Diamond St, San Francisco, CA 94131", user_id: 1},
  {name: "Pho Dong Huong", description: "Best pho around!", address: "667 Monterey Blvd, San Francisco, CA 94127", user_id: 1},
  {name: "Hwaro", description: "Sleek little Korean spot!", address: "4516 Mission St, San Francisco, CA 94112", user_id: 1}
])
