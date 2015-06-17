# Search

Perform a search

## Image search

After a user chooses tags to search on, this is the request you'll make.

### Endpoint

```/images``` (GET)


### Request Parameters

```groupId``` - The 'group' id to search within.  This corresponds to the site

__Group IDs:__

* Style: ```5494b6d5b126c448eae315db```

* Hair: ```54b55b2fc564e39cee3b3d2b```

The other request parameters correspond to the categories and tags within the config.

For each selected tag, you will add a query parameter in the format:
```[category.name].[filter.name][] = [tag.name]```

For example:

```
/images?malestyle.default[]=surferlong&malestyle.default[]=carvepart
```

__However, you should URL encode your request__

The actual request url after being encoded will look like:

```
/images?malestyle.default[]=surferlong&malestyle.default[]=carvepart
```

Additionally you can add a 'page' parameter:

```
/images?malestyle.default[]=surferlong&malestyle.default[]=carvepart&page=2
```

__'page' numbers start at '1'__ - Weird legacy quirk

Making a request without specifying the 'page' is equivalent to making a request with page=1

### Return Parameters

The response from the service is an array of images that matched the search.

For example:

```
[{
	"_id": "53a7c3280d71c3612b5f6498",
	"filename": "94287814-4fbb-492b-95dd-945d88d9a110.jpg",
	"height": 667,
	"source_image": "http://media-cache-ak0.pinimg.com/736x/c2/5b/8a/c25b8aacfd7cfa7a869b9a33f79ffc03.jpg",
	"source_url": "http://www.pinterest.com/pin/308637380683140827/",
	"width": 500,
	"weight": 1.0874135,
	"shortUrl": "http://lkl.st/1l2NPte"
}, {
	"_id": "53e5305ca79a3e48496968c5",
	"filename": "1ecdc3c4-e920-4744-9e31-e512ccda9578.jpg",
	"height": 600,
	"source_image": "http://www.menshairstyleguide.com/wp-content/uploads/2014/07/mens-undercut-41.jpg",
	"source_url": "http://www.menshairstyleguide.com/mens-undercut-hairstyle/",
	"width": 600,
	"weight": 0.997128,
	"shortUrl": "http://lkl.st/1ojPd1Y"
}]
```

Images will be returned in order starting with the best match.  You'll notice that as you move down the list the "weight" will decrease.  A weight higher than 0.9 should be considered an exact match to the search.

---

## Similar Image Search

This is a special case of image search that returns similar images.

### Endpoint

```/images``` (GET)


### Request Parameters

```similar``` (required) - The image id.  Finds images similar to the given image specified.

```page``` (optional) - The page number.  The first page is 1 which is equavalent to omitting the page entirely.

```groupId``` - The 'group' id to search within.  This corresponds to the site

__Group IDs:__

* Style: 5494b6d5b126c448eae315db

* Hair: 54b55b2fc564e39cee3b3d2b

For example:

https://api.lookli.st/v1/images?similar=542388f94220963a5eee5292&groupId=5494b6d5b126c448eae315db

### Sample Return

```
[{
	"_id": "542388f94220963a5eee5292",
	"filename": "b52a51a2-d139-4e16-9ea9-13889840738f.jpg",
	"height": 1020,
	"source_image": "http://www.befrassy.net/wp-content/uploads/2014/08/primarkretroaw11-680x1020.jpg",
	"source_url": "http://www.befrassy.net/",
	"width": 680,
	"weight": 2.98047,
	"shortUrl": "http://lkl.st/1u0qUaE",
	"tags": {
		"gender": {
			"default": [
				["female"]
			]
		}
	}
}, {
	"_id": "53ab1cc9948adb992779b3d7",
	"filename": "ae374a64-ab3e-41a1-9688-ad31623f506e.jpg",
	"height": 730,
	"source_image": "http://www.waynetippetts.com/wp-content/uploads/2014/04/0569.PFWFEBMARD2WT14bwp.jpg",
	"source_url": "http://www.waynetippetts.com/",
	"width": 486,
	"weight": 0.9872455,
	"shortUrl": "http://lkl.st/1jj8Twb",
	"tags": {
		"gender": {
			"default": [
				["female"]
			]
		}
	}
}, {

...
...
}]
```

---

## Individual Image Search By Image Id

Returns information about a particular image based on id.

### Endpoint

```/images``` (GET)

### Request Parameters

```id``` (required) - The image id

Example:

https://api.lookli.st/v1/images?id=53e3ee8e01026ee95b7da3ad


### Sample Return

```
{
	"_id": "53e3ee8e01026ee95b7da3ad",
	"filename": "8ce1775f-e9fe-4b85-97c4-76c5bcbd84f0.jpeg",
	"height": 570,
	"source_image": "http://images-ff.asos-media.com/shmotterstorage/71093/large_502f18e7-ae59-4e9e-8cf7-03911941f48e.jpeg",
	"source_url": "http://fashionfinder.asos.com/womens-looks/street-style-london-90917",
	"width": 380,
	"shortUrl": "http://lkl.st/1AYt6SY",
	"tags": {
		"gender": {
			"default": [
				["female"]
			]
		}
	}
}
```

