User.create(name: 'admin', password: 'rulestheserver')
User.create(name: '4changuy', password: 'forthelulz')
User.create(name: 'wiseone', password: 'knowledge')
admin = User.find_by(name: 'admin')
fourchan = User.find_by(name: '4changuy')
wiseone = User.find_by(name: 'wiseone')

cats = Topic.create(title: 'Moar Cat Pics!', content: 'Haha madejalook')
shark = Topic.create(title: 'Man gets eaten by Shark', content: 'A man got bitten on the foot by a small shark. It was treated with a bandaid. The man is currently recovering.')
denver = Topic.create(title: 'Denver Sunrise', content: 'Check out this picture of the mile high city sunrise! http://pictureandstuff.com/sunrise.jpg')

meme = Comment.create(content: 'Haha! memes and stuff', user_id: fourchan.id)
aww = Comment.create(content: 'poor man. hope he makes a full recovery!', user_id: admin.id)
love = Comment.create(content: 'love it!', user_id: wiseone.id)

admin.topics << denver
fourchan.topics << cats
wiseone.topics << shark

cats.comments << meme
shark.comments << aww
denver.comments << love
