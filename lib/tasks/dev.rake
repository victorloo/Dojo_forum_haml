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
end