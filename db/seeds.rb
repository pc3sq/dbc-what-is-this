require 'yaml'

seedfile = YAML.load(File.read('db/seed.yml'))

photo_urls = [
  "http://zippy.gfycat.com/CorruptReasonableAchillestang.gif",
  "http://i.imgur.com/cDakD23.gif",
  "http://s2.noelshack.com/uploads/images/8279761141080_bc56d65194a05dc295073d83f23687d1.jpg",
  "http://cdn.cutestpaw.com/wp-content/uploads/2012/10/l-What-is-this-sorcery.jpg",
  'http://oddstuffmagazine.com/wp-content/uploads/2011/11/tn51.jpg',
  'http://i.imgur.com/OpFdnzJ.jpg',
  'http://i.imgur.com/4CtGOvX.jpg',
  "http://i.imgur.com/NxCZ32J.jpg",
  'http://i.imgur.com/a5bxzeE.jpg?1',
  'http://i.imgur.com/RCBA8g8.jpg'
]

11.times do |index|
  User.create(
              seedfile['users']['name'][index],
              seedfile['users']['email'][index],
              seedfile['users']['password'][index],
              )
end

10.times do |index|
   Question.create(
                  seedfile['questions']['title'][index],
                  seedfile['questions']['caption'][index],
                  'image_path' => photo_urls[index],
                  )

    Response.create(
              seedfile['responses']['content'][index],
              )
    Comment.create(
              seedfile['comments']['body'][index],
              )
end