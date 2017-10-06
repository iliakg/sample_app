namespace :db do
  desc "Populate database"
  task populate: :environment do
    full_reset

    puts 'Create admin'
    Admin.create(email: 'admin@gmail.com', password: 123456)
    puts 'CREATED!!!'

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
  end

  def dummy title, number=1
    puts "Creating dummy #{title}..."
    number.times { yield }
    puts "...done"
  end
end
