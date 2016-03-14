User.create(name: 'admin', password: 'rulestheserver')
User.create(name: '4changuy', password: 'forthelulz')
User.create(name: 'wiseone', password: 'knowledge')
admin = User.find_by(name: 'admin')
fourchan = User.find_by(name: '4changuy')
wiseone = User.find_by(name: 'wiseone')

cats = Topic.find_or_create_by(title: 'Moar Cat Pics!', content: 'Haha madejalook')
shark = Topic.find_or_create_by(title: 'Man gets eaten by Shark', content: 'A man got bitten on the foot by a small shark. It was treated with a bandaid. The man is currently recovering.')
denver = Topic.find_or_create_by(title: 'Denver Sunrise', content: 'Check out this picture of the mile high city sunrise! http://pictureandstuff.com/sunrise.jpg')

meme = Comment.find_or_create_by(content: 'Haha! memes and stuff', user_id: fourchan.id)
aww = Comment.find_or_create_by(content: 'poor man. hope he makes a full recovery!', user_id: admin.id)
love = Comment.find_or_create_by(content: 'love it!', user_id: wiseone.id)

admin.topics << denver
fourchan.topics << cats
wiseone.topics << shark

cats.comments << meme
shark.comments << aww
denver.comments << love
