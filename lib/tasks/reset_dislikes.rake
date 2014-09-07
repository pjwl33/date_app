task reset_dislikes: :environment do
  desc "All dislikes are being reset..."
  puts "All dislikes are being reset..."
  User.all.each do |u|
    u.dislikes_id = nil
    u.save
  end
  puts "Done!"
end