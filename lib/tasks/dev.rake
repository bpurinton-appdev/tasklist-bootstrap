desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  User.destroy_all

  user = User.create email: "alice@example.com", password: "password"

  20.times do
    task = Task.new
    task.body = Faker::Hacker.say_something_smart
    task.status = ["not yet started", "in progress", "complete"].sample
    task.user_id = user.id
    task.save
  end

  if user.errors.any?
    p user.errors.full_messages
  end

  user = User.create email: "bob@example.com", password: "password"

  20.times do
    task = Task.new
    task.body = Faker::Hacker.say_something_smart
    task.status = ["not yet started", "in progress", "complete"].sample
    task.user_id = user.id
    task.save
  end

  p "#{User.count} users are in the DB."
  p "#{Task.count} tasks are in the DB."
end
