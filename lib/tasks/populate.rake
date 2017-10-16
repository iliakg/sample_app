namespace :db do
  desc "Populate database"
  task populate: :environment do
    full_reset

    puts 'Create admin'
    Admin.create(email: 'admin@gmail.com', password: 123456)
    puts 'CREATED!!!'

    c1 = Category.create(title: "1 #{FFaker::Lorem.word}")
      Category.create(title: "11 #{FFaker::Lorem.word}", parent_id: c1.id)
      c12 = Category.create(title: "12 #{FFaker::Lorem.word}", parent_id: c1.id)
        Category.create(title: "121 #{FFaker::Lorem.word}", parent_id: c12.id)
        Category.create(title: "122 #{FFaker::Lorem.word}", parent_id: c12.id)
        Category.create(title: "123 #{FFaker::Lorem.word}", parent_id: c12.id)
      Category.create(title: "13 #{FFaker::Lorem.word}", parent_id: c1.id)
    Category.create(title: "2 #{FFaker::Lorem.word}")
    c3 = Category.create(title: "3 #{FFaker::Lorem.word}")
      c31 = Category.create(title: "31 #{FFaker::Lorem.word}", parent_id: c3.id)
        Category.create(title: "311 #{FFaker::Lorem.word}", parent_id: c31.id)
    Category.create(title: "4 #{FFaker::Lorem.word}")
    c5 = Category.create(title: "5 #{FFaker::Lorem.word}")
      Category.create(title: "51 #{FFaker::Lorem.word}", parent_id: c5.id)


    dummy :users, 100 do
      post = User.new
      post.email = FFaker::Internet.email
      post.password = 'password'
      post.save
    end

    dummy :posts, 100 do
      post = Post.new
      post.title = FFaker::Lorem.sentence
      post.text = FFaker::Lorem.paragraphs(10).map{|p| "<p>#{p}</p>"}.join
      post.published = [true, false].sample
      post.save
    end
  end

  def full_reset
    Rake::Task['db:reset'].invoke
    FileUtils.rm_rf(Dir["#{Rails.root}/public/files"])
  end

  def dummy title, number=1
    puts "Creating dummy #{title}..."
    number.times { yield }
    puts "...done"
  end
end
