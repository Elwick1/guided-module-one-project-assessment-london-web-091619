User.destroy_all
Game.destroy_all
Review.destroy_all


game1 = Game.create(name: "Super Plumber-Man", description: "The Evil WOWSER has blocked all the toilets in the Vegetable kingdom! Join Giovanni, the best plumber around, on an epic quest to Un-Clog those pipes!" )
game2 = Game.create(name: "Dino-Existential crisis",description: "These Dinosaurs just don't see the point in living anymore!, Play as a giant meteor and help 'em out!")
game3 = Game.create(name: "The Younger Scrolls VI GroundBrink", description: "Embark on an epic adventure, create your character and delve into loot filled dungeons, fight mighty foes and make life altering choices")
game4 = Game.create(name: "Office Tycoon", description: "Take a trip to fame and fortune by building the biggest, best and most intruding to the natural landscape, Office Blocks around - Can YOU become the ultimate OFFICE TYCOON?")
game5 = Game.create(name: "Resident Bad", description: "A series of strange attacks have been reported close to a remote biotech lab, play as the members of S.P.A.R.S, and SURVIVE BY ANY MEANS NECESSARY!!!")
game6 = Game.create(name: "Metal Cog Liquid", description: "You are Snail, a government agent on a mission to regain control of a secret nuclear weapons base from the hands of terrorists")
game7 = Game.create(name: "Super Crash Sisters", description: "Duke it out as your favourite Mintendo Characters")
game8 = Game.create(name: "Road Brawler", description: "GET READY TO RUMBLE! the best fighters from across the world throw down in the middle of the road")
game9 = Game.create(name: "Tomb Plunderer", description: "Tara Loft is the greatest relic hunter in the world, search for the lost treasures in ancient jungles")
game10 = Game.create(name: "Immortal Wombat", description: "PREPARE YOURSELF! Immortal Animals challenge each other to see who is the strongest of them all")

user1 = User.create(username: "MichaelRW", password: "Crocodile")
user2 = User.create(username: "JoeC", password: "password1")
user3 = User.create(username: "BackyardDave", password: "Dave")
user4 = User.create(username: "Citrus_Fresh", password: "FRESH")
user5 = User.create(username: "GlitchQueen", password: "passw0rd")
user6 = User.create(username: "DarthVader", password: "darkside")
user7 = User.create(username: "Jestergurl", password: "FEmale")
user8 = User.create(username: "SmokeyJoe", password: "420")
user9 = User.create(username: "KASIA", password: "03021996")
user10 =User.create(username: "MikeyMike", password: "mw") 

review1 = Review.create(user_id: user1.id, game_id: game1.id, content: "I LOVE THIS GAME!, an instant classic, who'd have thought plumbing could be so fun?", rating: 5)
review2 = Review.create(user_id: user4.id, game_id: game2.id, content: "Damn those are some depressed-Dino's, putting them out of their misery was super entertaining, can't wait for the sequel!!", rating: 4)
review3 = Review.create(user_id: user2.id, game_id: game5.id, content: "I've never been more scared in my entire life, DO NOT PLAY THIS ALONE!!!", rating: 4)
review4 = Review.create(user_id: user6.id, game_id: game3.id, content: "I have lost hours of my life to this game, all my relationships have failed and i now have no friends and a serious vitamin D deficiency, but at least i have a level 120 cleric!", rating: 5)
review5 = Review.create(user_id: user3.id, game_id: game4.id, content: "This game sucks, $44.99 just to build offices? Spare yourself the pain and boredom that follows this mundane game", rating: 1)
review6 = Review.create(user_id: user5.id, game_id: game6.id, content: "WOW this game was the bomb, just super weird though and i kept getting stuck, spent hours looking for a code and it just doesn't exist!", rating: 3)
review7 = Review.create(user_id: user9.id, game_id: game9.id, content: "An instant classic! WHAT A GAME!!!", rating: 5)
review8 = Review.create(user_id: user7.id, game_id: game10.id, content: "Don't bother, i hated it, terrible controls and abuse of animals. very unrealistic", rating: 1)
review9 = Review.create(user_id: user8.id, game_id: game7.id, content: "Finally! i waited so long for this, very entertaining would recommend to anyone", rating: 4)
review10 = Review.create(user_id: user10.id, game_id: game8.id, content: "i didn't like it, it feels dated. maybe i just suck", rating: 2)
review11 = Review.create(user_id: user2.id, game_id: game6.id, content: "Wow! i've never so Challenged, Pretty difficult if you're not a stealthy player but real fun", rating: 3)
#USER.ID and GAME.ID are there because Tim helped me sort out my seed data and it somehow replicated to we destroyed
#it and this was the only way i could get it to work again. 