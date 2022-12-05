# the-mcculloughs.org 

A digitised family slide, photo and video album for my family.

![the-mcculloughs.org](/assets/icon.png "the-mcculloughs.org")

## Premise

My Mother and Father were together since they were teenagers. They made it to
forty eight years of marriage and together for well over fifty. 

In that time they have took pictures and videos. The problem is that these
pictures and videos are all in different types of media. There is no one place
to view them all.

 - 35mm slides
 - Polaroids
 - Photographs
 - VHS Tapes
 - Digital photos
 - Digital videos

This app will take all of the above and put them in one place to be viewed (at
https://the-mcculloughs.org). It wont rely on
[Facebook](https://www.facebook.com), [Google](https://www.google.com) or any
third party sites. Though media could be ingested from them.

The media will be tagged accordingly and searchable.

## Development

A MVP has to be delivered by Christmas 2022. I want to do develop this project
in public. I will start of hosting a static site on s3 and move on from there.

When the static site is up I will add issues on the project and link them from 
here.

### Description

This is going to my main project for a while as such it will have to be
interesting on a technical level. I will use the following technology:

- [Rails](https://rubyonrails.org/)
- [Postgres](https://www.postgresql.org/)
- [Sidekiq](https://sidekiq.org/)
- [Redis](https://redislabs.com/)

This is a fairly standard stack. The app will be hosted on [Amazon Web
Services](https://aws.amazon.com/).

I am currently unsure of what software to process a video with to make it web
consumable and for thumbnail generation. However I will update this README with
the software choosen when it comes to it.

### Steps

- Set up a production environment

These two actions are quite wide but I want to put a bit of time into good
practises for infrastructure. The app itself can be tightened up but I want a
good foundation on the infrastructure side.

### Running

#### Natively

- `foreman start`

### Multi container architecture

Eventually there will be a separate docker-compose.yml for development and
production. The whole stack is divided into multiple different containers:

- *app:* Main part. It contains the Rails code to handle web requests (by using
  the Puma gem). See the Dockerfile for details. The image is based on the
  Alpine variant of the official Ruby image and uses multi-stage building.
- *worker:* Background processing. It contains the same Rails code, but only
  runs Sidekiq
- *db:* PostgreSQL database
- *redis:* In-memory key/value store (used by Sidekiq, ActionCable and for
  caching)

### Tests & Continuous Integration

Not part of MVP but something I want done very quickly after is on every push,
the test suite (including RuboCop checks) is performed via GitHub Actions. If
successful, a production image is built and pushed to a private GitLab Docker
Registry.

## Future Features

In no order (just a brain dump) I want to incorporate the following in this
project:

- Auto refresh via ActionCable: If an asset gets updated by another
  user/instance, it refreshes automatically using the publish/subscribe pattern
- Tagging of assets
- Uploading assets directly to S3 with the Shrine gem and jQuery-File-Upload
- Background jobs with ActiveJob and the Sidekiq gem (to handle asset
  processing and ActionCable broadcasting)
- Cron scheduling with Sidekiq-Cron to handle ingesting of assets from Google
  shared albums
- Permalinks using the FriendlyId gem
- Infinitive scrolling (using the Kaminari gem and some JavaScript)
- Sending HTML e-mails with Premailer and the Really Simple Responsive HTML
  Email Template 

