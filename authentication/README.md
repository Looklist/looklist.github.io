# Authentication

Looklist requires that you register an app and obtain an ```apiToken```

Your ```apiToken``` works in conjunction with whitelisted domains, so you don't need to keep it a secret.

## Making requests

The ```apiToken``` should be included in the header ```looklist-api-token```

For example, using jquery:

```
$.ajax({
    type: 'GET',
    dataType: 'json',
    headers: {
        'looklist-api-token':'12345678-1234-1234-1234-123456789012'
    },
    url: 'https://api.lookli.st/v1/config',
    success: function(result) {
        console.log('success!');
    },
    error: function(result) {
        console.log('error');
        console.log(result);
    }
});
```

## Authentication Errors

```
{
	"status": "failure",
	"reason": "no api token present"
}
```

```
{
	"status": "failure",
	"reason": "invalid api token"
}
```

```
{
	"status": "failure",
	"reason": "invalid domain"
}
```
