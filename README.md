Sinatra Subreddit App
====================

A Sinatra application meant to mimic the functionality of a single subreddit of reddit. It will function and run out of the box when deployed to [OpenShift](https://www.openshift.com/).


Running this application locally
----------------------------------

Before running any of these examples, you should run the below command to make sure that you have the correct ruby gems installed

		bundle install --without production

To run this application locally, cd into the sinatra-subreddit-app directory that you cloned and run

		shotgun

To run the migrations and create a local sqlite database run

		rake db:migrate


Thanks to:

The original [Sinatra QuickStart by OpenShift](https://hub.openshift.com/quickstarts/118-sinatra)

License
-------

This code is dedicated to the public domain to the maximum extent
permitted by applicable law, pursuant to the Unlicense
http://unlicense.org/
