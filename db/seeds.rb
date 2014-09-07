# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dislikes = ["Channing Tatum", "Selfies", "Cottage Cheese", "Holidays", "Snow", "Wet Roads", "Buzzfeed", "Facebook", "Nerds", "Geeks", "Chinese Food", "People Who Think They Know Everything", "People Who Think They are the Shit", "Children", "Star Wars", "Lord of the Rings", "Harry Potter", "Food", "Moving", "Know it Alls", "Racist Jokes", "Jokes", "People Who Try to Be Funny", "Your Boss", "Your Co-workers", "People who talk really loudly on the subway", "people on their phones", "bitches", "bastards", "assholes", "buttholes", "pooping", "shopping", "traveling", "cheddar cheese", "coffee", "starbucks coffee", "regular people", "boring people", "work", "working out", "jumping", "music", "hipsters", "parents", "siblings", "douchebags", "people who smile for no reason", "fat people", "skinny people", "radiohead", "cold play", "lil' jon", "2 chainz", "justin beiber", "the kardashians", "sports", "sports teams", "bandwagon fans", "people who talk behind your back", "racist people", "people who can't take a joke", "people with no sense of humor", "overworking", "shiny objects", "drugs", "alcohol", "people who try too hard", "people who don't get me", "teenagers", "middle-aged people", "religious people", "religion", "loose change", "asymmetry", "karaoke bars", "spicy foods", "driving", "walking" ,"running", "rain", "humidity", "mis-matched clothing", "singing in front of peopel", "dancing in front of people", "dinosaurs", "quirky peopel", "people who think they're being random but actually just being annoying", "annoying people", "unicorns", "farts that smell bad", "showtime (subway dancers)", "people who ask for money", "people who don't pay you back", "liers", "dumb people", "grammar nazis", "gamers", "high people", "stoners", "people who use acronyms (i.e. 'OMG', 'LOL', 'WTF') in real-life coversations", "people who smell bad", "body-odor", "poop", "dogs", "cats", "pets in general", "ketchup", "pickles", "coach", "louis vouiton", "gucci", "fendi", "prada", "ray bands", "fashionable people", "smelly feet", "people who don't shave (face or elsewhere)", "selfish lovers", "people who smack their gum", "cheaters", "maniuplative people", "loud people", "airplanes", "ignorant people", "that random person that keeps messaging you", "people who don't listen", "pizza", "fish", "meat", "potatoes", "emma watson", "emma stone", "ryan gosling", "lindsey lohan", "heartbreak", "new year's", "valentine's day", "christmas", "hannukah", "fireworks", "delayed transportation", "flaky people", "paying for things", "spending money", "cops", "teachers", "san francisco", "new york"]

dislikes.each do |d|
  Dislike.create(type_of: d)
end

first_names = ["Paul", "John", "Luke", "Jane", "Jenny", "Ariel", "Ruby", "Julia", "Ryan", "Steve", "Lauren", "Alex", "Karen", "Katarina", "Carly", "Patrick", "Eric", "Chris", "Amy", "Margo", "Matthew", "Rohin" ,"Payam", "Jenna", "Sherry", "Carol", "Catherine", "Cathy", "Laura", "Jason", "Rachel"]
last_names = ["Lee", "Smith", "Jones", "White", "Black", "Huang", "Davis", "Torres", "Muhammed", "Heisenberg", "Rosenberg", "Goldberg", "Hannah", "West", "Eastwood", "Bond", "Myers", "Powers", "Obama", "Kennedy", "Adams", "Scott"]

def random_token
  new_token = []
  80.times {new_token << ('a'..'z').to_a.sample}
  80.times {new_token << ('A'..'Z').to_a.sample}
  80.times {new_token << (0..9).to_a.sample}
  new_token.shuffle.join
end

def random_num
  new_num = []
  13.times {new_num << (0..9).to_a.sample}
  new_num.join
end

def image_category
  ['people', 'sports', 'fashion', 'nightlife'].sample
end

250.times do
  User.create({
    provider: 'facebook',
    uid: random_num,
    name: "#{first_names.sample} #{last_names.sample}",
    oauth_token: random_token,
    oauth_expires_at: Time.now + 2.years,
    email: 'user@hatetolove.com',
    gender: [true, false].sample,
    image: "http://lorempixel.com/350/350/#{image_category}/"
    })
end


