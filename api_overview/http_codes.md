# HTTP Response Codes and Errors

A valid, non-error response will always use the HTTP status code:

* __200__ - Ok

Most errors should be accompanied by a "reason" for the error.  JSON responses will look like:

```
{
	"status": "failure",
	"reason": "User not logged in"
}
```

In addition to the plain reason, responses will also use HTTP status codes for their semantic meaning:

* __400__ - Bad request.  Missing or bad request parameters

* __403__ - Forbidden.  Authentication has failed

* __404__ - Not found

* __500__ - Server error
