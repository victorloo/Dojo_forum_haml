namespace :dev do
  task fake_posts: :environment do
    10.times do |i|
      Post.create!(
        title: FFaker::Book.title,
        content: FFaker::Lorem.paragraph,
        user: User.all.sample
      )
    end
    puts "have created fake posts"
    puts "now you have #{Post.count} posts data"
  end

  task fake_users: :environment do
    users = ["homer", "bart", "marge", "lisa", "maggie"]
    users.each do |user|
      user_name = user
      User.create!(
        name: user_name,
        email: "#{user_name}@simpson.com",
        password: "123456"
      )
      puts "User #{user_name} created"
    end
    puts "now you have #{Uesr.count} users data"
  end

  task fake_comments: :environment do
    Comment.all.destroy_all
    Post.all.each do |post|
      numb = rand(10..25)
      numb.times do |i|
        post.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
      post.lastreplies = post.comments.last.created_at
      puts "post #{post.title} have created #{post.comments_count} fake comments"
    end
    
    puts "now you have #{Comment.count} comments data"
  end
end