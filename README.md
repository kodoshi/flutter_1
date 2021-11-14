# VaporWare, unit M-TRC-836 & M-TRC-837

Team members:

- Gianni Saliniere-Coursy

- Klivens Ziu

- Lucas Mathieux

- Leyton Ly


## Backend

Commands to start the Nodejs server in /backend folder:

`npm install`

`npm start`

Make sure to create a .env file and update the variables, based on the .env.sample provided.

A cloud mongo instance is being used at the moment.

## Mobile

Commands to start the Flutter app in /mobile folder:

`flutter pub get`

`flutter run`

## API routes

#### More details can be found in the JSDOC annotations inside /backend/docs/index.html, db models also included below. A Postman collection is included in the /postman folder, it details routes, arguments and holds examples of responses.

  

### User Routes

#### Playlist Tile routes

- GET /user/tiles => (returns array of Playlists)

- POST /user/tiles/:tileID => (adds specific Playlist object into the active tiles array)

- DELETE /user/tiles/:tileID => (removes specific Playlist object from the active tiles array)

  

#### User Personal routes

- GET /user/stats => (returns SingleDayStat object array)

- PUT /user/stats => (adds playtime to whichever SingleDayStat is activated at that time)

- GET /user/personal => (returns name, surname, email, image fields from User object)

- POST /user/picture => (return string representation of an image file, stored in User)

  

### Playlist Routes

- GET /playlists => (returns all existing Playlist objects into an array)

- GET /playlists/community => (returns all existing Playlist objects into an array, categorized)

  

## Models

- User :

```
name: {
	type: String,
	default: "John",
},

surname: {
	type: String,
	default: "Smith",
},

email: {
	type: String,
	default: "test@email.com",
},

image: {
	type: String,
},

active_tiles: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }], 

stats: [
	{
		type: mongoose.Schema.ObjectId,
		ref: "SingleDayStat",
	},
],

```

- Playlist:

```
index: {
	type: Number,
	default: 0,
},

description: {
	type: String,
	default: "Lorem Ipsum",
},

category: {
	type: String,
	default: "Nature",
},

image: {
	type: String,
	default: "street_japan_night.jpg",
},

songs: [
	{
		type: String,
		default: "lofi.mp3",
	},
],

meta: {
	title: { type: String, default: "Lo-Fi" },
	artist: { type: String, default: "Various Artists" },
	album: { type: String, default: "Instrumentals" },
},

```

  

- SingleDayStat:

```
day: {
	type: String,
	default: "Monday",
},

pop: {
	percentage: { type: Number, default: 0, },
	playtime: { type: Number, default: 0, },
},

nature: {
	percentage: { type: Number, default: 0, },
	playtime: { type: Number, default: 0, },
},

instrumental: {
	percentage: { type: Number, default: 0, },
	playtime: { type: Number, default: 0, },
},

total_playtime: {
	type: Number,
	default: 0,
},
```

  

- Community:

```

pop_playlists: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }],

nature_playlists: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }],

instrumental_playlists: [{ type: mongoose.Schema.ObjectId, ref: "Playlist" }],

```
