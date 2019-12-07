# the-mcculloughs.org 

A digitised family slide, photo and video album for my family.

## Premise

My Mother and Father have been together since they were teenagers. At the time of writing they have been married over forty years and together for over fifty. In this time they have taken pictures and videos. The problem is that these pictures and videos are all in different types of media. There is no one place to view them all.

 - 35mm slides
 - Polaroids
 - Photographs
 - VHS Tapes
 - Digital photos
 - Digital videos

This app will take all of the above and put them in one place to be viewed (at https://the-mcculloughs.org). It wont rely on [Facebook](https://www.facebook.com), [Google](https://www.google.com) or any third party sites. Though media could be ingested from them.

The media will be tagged accordingly and searchable.

The first media I will be converting will be from VHS to digital (December 2019) - in time for Christmas.

## Development

A MVP has to be delivered by Christmas 2019. Therefore the only media that will be consumed will be digital video. 

### Features

- A user can sign in via an invite only.
- A user can upload a video and save it.
- A user can search for a video.
- A user can sign out.

### Description

This is going to my main project for a while as such it will have to be interesting on a technical level. I will use the following technology:

- [Rails](https://rubyonrails.org/)
- [Postgres](https://www.postgresql.org/)
- [Sidekiq](https://sidekiq.org/)
- [Redis](https://redislabs.com/)

This is a fairly standard stack. The app will be hosted on [Amazon Web Services](https://aws.amazon.com/).

I will deliver a MVP by Christmas of 2019. As such I wont worry (for the time being) about tests and will be using the generic `scaffold` command.

I am currently unsure of what software to process a video with to make it web consumable and for thumbnail generation. However I will update this README with the software choosen when it comes to it.

### Steps

- Get the app running in docker
- Set up a production environment

These two actions are quite wide but I want to put a bit of time into good practises for infrastructure. The app itself can be tightened up but I want a good foundation on the infrastructure side.

### Running

#### Natively

- `foreman start`

#### Docker

- `docker-compose build`
- `docker-compose run app yarn install`
- `docker-compose up`

- Go to your browser on http://localhost:3000

### Multi container architecture

There will be a separate docker-compose.yml for development and production. The whole stack is divided into multiple different containers:

- *app:* Main part. It contains the Rails code to handle web requests (by using the Puma gem). See the Dockerfile for details. The image is based on the Alpine variant of the official Ruby image and uses multi-stage building.
- *worker:* Background processing. It contains the same Rails code, but only runs Sidekiq
- *db:* PostgreSQL database
- *redis:* In-memory key/value store (used by Sidekiq, ActionCable and for caching)

### Tests & Continuous Integration

Not part of MVP but something I want done very quickly after is on every
push, the test suite (including RuboCop checks) is performed via GitHub
Actions. If successful, a production image is built and pushed to a private
GitLab Docker Registry.

## Future Features

In no order (just a brain dump) I want to incorporate the following in this project:

- Auto refresh via ActionCable: If an asset gets updated by another user/instance, it refreshes automatically using the publish/subscribe pattern
- Tagging of assets
- Uploading assets directly to S3 with the Shrine gem and jQuery-File-Upload
- Background jobs with ActiveJob and the Sidekiq gem (to handle asset processing and ActionCable broadcasting)
- Cron scheduling with Sidekiq-Cron to handle ingesting of assets from Google shared albums
- Permalinks using the FriendlyId gem
- Infinitive scrolling (using the Kaminari gem and some JavaScript)
- Sending HTML e-mails with Premailer and the Really Simple Responsive HTML Email Template 
