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



markdown_content = <<-MRK
Toast-It
====================

Toast-It is a Sinatra CRUD application meant to mimic some the functionality of reddit. It will function and run out of the box when deployed to [OpenShift](https://www.openshift.com/).


Running this application locally
----------------------------------

Before running any of these examples, you should cd into the toast-it directory that you cloned and run the below command to ensure all required gems are installed

		bundle install --without production

To run this application locally the migrations must be executed in order to create a local sqlite database. Make sure your working directory is the toast-it root path and run

		rake db:migrate

The pages will be empty looking without any content. Seed the database with

		rake db:seed

Then start your local web server with

		shotgun

Deploying this application to OpenShift
----------------------------------

This application is designed to be deployed to RedHat's OpenShift service. First [signup for a free account](https://www.openshift.com/app/account/new). Install [rhc tools](https://developers.openshift.com/en/getting-started-osx.html#client-tools) and run `rhc setup` to authenticate to your account. You are now ready to deploy using a simple terminal command

		rhc app create toastit ruby-2.0 mysql-5.5 phpmyadmin --from-code=git://github.com/thegands/toast-it.git -e BUNDLE_WITHOUT='development test'

Be patient, the deployment process will take several minutes. Once deployment is complete rhc will automatically clone the deployed application code to your working directory. You can make any changes to the code, commit them, then push them to OpenShift using git to easily customize your Toast-It deployment.

Your deployed application will not function without running the migrations. Start a secure shell session with your OpenShift application by running

		rhc ssh -a toastit

Then change your working directory to the code directory

		cd app-root/repo

Now you are ready to run the migrations and finalize your Toast-It deployment

		bundle exec rake db:migrate RACK_ENV=production

The pages will be empty looking without any content. Seed the production database with

		bundle exec rake db:seed RACK_ENV=production



Thanks to:
-------

The original [Sinatra QuickStart by OpenShift](https://hub.openshift.com/quickstarts/118-sinatra)

The [Materialize responsive front end framework](http://materializecss.com/)



License
-------

This code is dedicated to the public domain to the maximum extent
permitted by applicable law, pursuant to the Unlicense
http://unlicense.org/
MRK

markdown_example = Topic.find_or_create_by(title: 'Markdown is Supported!', content: markdown_content)
nice = Comment.find_or_create_by(content: 'markdown rocks! nice!', user_id: wiseone.id)

admin.topics << markdown_example
markdown_example.comments << nice
