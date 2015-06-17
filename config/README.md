# Config

Returns information about the site, filters, and tags that are used in various api requests.

## Get Config

Retrieves the global config

### Endpoint

```/config``` (GET)

Full URL: ```https://api.lookli.st/v1/config```

### Request Params

none

### Response

#### Success

```
{
	'masterConfig': {
		... // The full groups / categories / tag config
	},
	'assetPath': "//img.lookli.st/ll-1.0.0", // The base path for assets (images)
	'scriptStylePath': "//www.lookli.st/1.0.5", // The base path to retrieve static css and js from
	'baseUrl': "https://www.lookli.st", // Base URLs
	'baseApiUrl': "https://api.lookli.st",
	'baseUrlStyle': "https://style.lookli.st",
	'baseUrlHair': "https://hair.lookli.st"
}
```

#### Failure

##### Server error  (HTTP Code: 500)

```
{
  'status': 'failure',
  'reason': 'server error'
}
```
