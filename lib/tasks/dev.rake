namespace :dev do
  task fake_users_simpson: :environment do
    users = ["homer", "bart", "marge", "lisa", "maggie"]
    users.each do |user|
      user_name = user
      User.create!(
        name: user_name,
        email: "#{user_name}@simpson.com",
        password: "123456",
        inrto: "We are simpson family.",
        authentication_token: Devise.friendly_token
      )
      puts "User #{user_name} created"
    end
    puts "now you have #{Uesr.count} users data"
  end

  task fake_user: :environment do
    3.times do |i|
      name = FFaker::Name::first_name
      user = User.new(
        name: name,
        email: "#{name}@example.co",
        password: "123456",
        intro: FFaker::Lorem::sentence(30),
        authentication_token: Devise.friendly_token
      )
      user.save!
      puts user.name
    end
  end

  task fake_others: :environment do
    Rake::Task['dev:fake_posts'].execute
    Rake::Task['dev:fake_comments'].execute
    Rake::Task['dev:fake_collection'].execute
    Rake::Task['dev:fake_folder'].execute
    Rake::Task['dev:fake_views_count'].execute
    Rake::Task['dev:fake_friend'].execute
  end

  task fake_posts: :environment do
    30.times do |i|
      Post.create!(
        title: FFaker::Book.title,
        content: FFaker::Lorem.paragraph,
        user: User.all.sample,
        privacy: Post::POST_PRIVACY.sample.second,
        status: Post::POST_STATUS.sample.second
      )
    end
    puts "have created fake posts"
    puts "now you have #{Post.count} posts data"
  end

  task fake_comments: :environment do
    Comment.all.destroy_all
    all_post = Post.all.where(status: "published").where(privacy: "all")
    all_post.each do |post|
      numb = rand(10..25)
      numb.times do |i|
        post.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
      post.lastreplies = post.comments.last.created_at
      post.save!
      puts "post #{post.title} have created #{post.comments_count} fake comments"
    end
    puts "now you have #{Comment.count} comments data"
  end

  task fake_collection: :environment do
    50.times do
      user = User.all.sample
      post = Post.all.sample
      unless post.collections.create(user: user)
        return
      end
    end
    puts "hava created fake collections"
    puts "now you have #{Collection.count} collection data."
  end

  task fake_folder: :environment do
    Folder.all.destroy_all
    Post.all.each do |post|
      numb = rand(1..4)
      numb.times do |i|
        category = Category.all.sample 
        unless Folder.all.where(post_id: post.id).pluck(:category_id).include?(category.id)
          post.folders.create!(
            category_id: category.id
          )
        end
      end
    end
    puts "have created fake folders"
    puts "now you have #{Folder.count} folder data"
  end

  task fake_views_count: :environment do
    300.times do
      user = User.all.sample
      post = Post.all.sample
      post.views.create!(user: user)
    end
    puts "hava created fake views_count"
    puts "now you have #{View.count} view data."
  end

  task fake_friend: :environment do
    Confirmation.destroy_all
    User.all.each do |user|
      10.times do |i|
        friend = User.all.sample 
        unless user.id == friend.id || Confirmation.all.where(user_id: user.id).pluck(:friend_id).include?(friend.id)
          user.confirmations.create!(
            friend_id: friend.id
          )
        end
      end
    end
    puts "have created fake friends"
    puts "now you have #{Confirmation.count} confirmations data"
  end
end