# Images

All looklist images are served from a global CDN.  The path to images must be built.

## Image Object

A single image object explained:

```
{
    width: 500,
    height: 750,
    filename: "8a6f3c05-66eb-4ad9-812b-2feff30695e6.jpg",
    _user: "",
    source_image: "http://chicametipo.com.br/blog/wp-content/uploads/2014/10/14e9de55ea160b7c0bb37979df743820.jpg",
    source_url: "http://chicametipo.com.br/2014/combo-do-verao/&amp;amp;setId=5580b09cca2df74d2747a608",
    _group: "5494b6d5b126c448eae315db",
    _id: "5580ba09aff64c50278a2ac7",
    weight: null,
    shortUrl: "https://www.lookli.st/looks/5580ba09aff64c50278a2ac7",
    tags: {
        gender: {
            default: [
                "female"
            ]
        }
    }
}
```

```_id``` : The image id.  Used to make api requests about a specific image

```width``` : The original image width in pixels

```height``` : The original image height in pixels

```filename``` : The image filename.  Used to build the url for the image

```_user``` : The user id of the person who created this image.  **Note**: This may be blank.  Images created during our private beta do not have user information associated

```source_image``` : The original source image.  Where the image came from

```source_url``` : The original site or page within a site where the image came from

```_group``` : The group id (corresponds to the site...style, hair, etc.)

```weight``` : How closely this image matches a search (or another image in the case of similar search).  Anything 0.9 or higher should be considered an exact match. **Note**: May be null.

```shortUrl``` : **DEPRECATED** Do not use this.

```tags``` : Shows a subset of the tags on this image.  Currently we only publicly display the 'gender' tag.  All other tags are hidden.

## Display An Image

After you've performed a search, you'll have an array of image objects:

```
[
    ...
    {
        width: 500,
        height: 750,
        filename: "8a6f3c05-66eb-4ad9-812b-2feff30695e6.jpg",
        _user: "",
        source_image: "http://chicametipo.com.br/blog/wp-content/uploads/2014/10/14e9de55ea160b7c0bb37979df743820.jpg",
        source_url: "http://chicametipo.com.br/2014/combo-do-verao/&amp;amp;setId=5580b09cca2df74d2747a608",
        _group: "5494b6d5b126c448eae315db",
        _id: "5580ba09aff64c50278a2ac7",
        weight: null,
        shortUrl: "https://www.lookli.st/looks/5580ba09aff64c50278a2ac7",
        tags: {
            gender: {
                default: [
                    "female"
                ]
            }
        }
    },
    ...
]
```

You'll also need to grab the ```assetPath``` from the [config](../config/index.html) api response.

Once you have these items, you can build the image url like so:

```
var imageUrl = config.assetPath + '/images/' + image.filename;
```

You'll be left with a url that looks like:

```
//assets.lookli.st/images/8a6f3c05-66eb-4ad9-812b-2feff30695e6.jpg
```

Notice that the https(s) prefix is not added.  This is because images are available over http OR https...your choice.

[http://assets.lookli.st/images/8a6f3c05-66eb-4ad9-812b-2feff30695e6.jpg](http://assets.lookli.st/images/8a6f3c05-66eb-4ad9-812b-2feff30695e6.jpg)

[https://assets.lookli.st/images/8a6f3c05-66eb-4ad9-812b-2feff30695e6.jpg](https://assets.lookli.st/images/8a6f3c05-66eb-4ad9-812b-2feff30695e6.jpg)

Additionally, you may (optionally) specify the width and/or height of the image in your request.  If no height or width is specified, the original image will be returned.

**The aspect ratio of the image is always maintained**.  If you specify both width and height, it will return whichever results in a larger overall image.

**Note**: There is no guarantee that the image returned will be exactly the width and/or height specified.

For example:
[http://assets.lookli.st/images/8a6f3c05-66eb-4ad9-812b-2feff30695e6w516.jpg](http://assets.lookli.st/images/8a6f3c05-66eb-4ad9-812b-2feff30695e6w516.jpg)


### Allowed Widths

200, 258, 400, 516, 516, 800


**Need more?** Contact us at [dev@lookli.st](mailto:dev@lookli.st)
