FactoryGirl.define do
  factory :admin, class: Role do
    name "123@ait.asia"
    #email "joe_teacher@ait.asia"
    #password "password"
  end
  factory :signin, class: User do
    @admin = Role.create(name: "Admin")
    email "admin@ait.asia"
    password "secret123"
    password_confirmation "secret123"
    role @admin
  end
  factory :project do
    name "My favorite project"
    url "http://localhost:3000/home/adminmain"
  end

  factory :post, class:Post do
    name "Postname"
    description "postdesp"
  end

  factory :post1, class:Post do
    name "Postname"
    description "postdesp"
    image { File.new(Rails.root.join('image.jpg')) }
    id '1'
  end


  factory :batchbook, class:Batch do
    studentid '119149'
    studentname "Surya"
    fos "cs"
    expirydate '12-12-2017'
  end

  factory :admin1, class: User do
    name "Joe"
    email "joe_teacher@ait.asia"
    password "password"
    password_confirmation "password"
    role_id "1"
  end

  factory :assign_task, class: AssignTask do
    title "Joe Student"
    description "123456"
    deadline { DateTime.now }
    user_id "1"
  end

  factory :equipment, class: Equipment do
    name "wire"
    total "12"
    condition "good"
    status "N/A"
  end
end