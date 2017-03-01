# URLockBox

The URLockbox is an app where an authenticated user can save links. Links can be marked as read, which then adds them to the "Hot Reads" app, where the top ten are listed by number of reads across all users.

### Setup:

Clone: `git clone https://github.com/annadolan/temp-mid-mod-1.git`

Checkout the "final" branch: `git checkout final`

Install dependencies: `bundle install`

Set up database: `rake db:create db:migrate`

Run locally: `rails s`

#### API

This app includes an API and uses jQuery Ajax for some functionality. The endpoints are as follows:

`POST /api/v1/links` - creates a new link. Request format: `{ link: { url: url } }`

`PATCH /api/v1/links/:id` - updates read status on an existing link. Request format: `{ read: false }`

`POST /api/v1/read_links` - creates a new link for each object in an array of JSON hashes received via a GET request to Hot Reads.
