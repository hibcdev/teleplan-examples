# Teleplan Web Service Examples

These html pages demonstrate the functions of the Teleplan Web Services.  They are provided to 3rd party developers to assist in calling the Web Services.   These are for development and demonstration purposes only, not to be incorporated into any software.

These are "live" files.   The `index.html` file can be opened in any browser by just double clicking on it.  Links to the other files are inside.   All the forms, such as login, logout, etc work. You just need to press the "back" key on the browser to return to the page after getting a response.

## What is RFC-6265?

RFC-6265 is, among other things, the IETF standard for managing state between individual HTTP requests from a
client to a server. It describes how servers and clients should behave to maintain state using cookies.

## What do I need to do to make my software compliant?

To maintain state with Teleplan Web all client software MUST always return any cookie that was sent as part of any
previous HTTP response. There will very likely be more than one cookie sent by the server and they must all be sent
back unaltered in every subsequent HTTP request. The name (key) of the cookie can be random.

## Would this be a security concern to me? I heard cookies can cause problems with privacy.

While there is certainly misuse of cookies by many websites, these are almost always “persistent” cookies that get
sent back days or even weeks later to allow the server to track your activity. Teleplan will never send persistent
cookies (i.e., cookies that survive the session) and you should not be saving these cookies for later re-use as they
will expire as soon as you send a logout request.

## What happens if my software does not send back cookies?

If cookies are not sent back your software will almost certainly lose its login session and subsequent requests will
fail with an error response that contains “User is not logged in or session expired”. In short, your software will not be
able to communicate with the Teleplan Web Services API and your users will experience unexpected errors.

## How can I test my software to ensure it is compliant?

There is a TEST Teleplan “sandbox” site available to you at: https://tlpt2.moh.hnet.bc.ca/. This site works exactly like
the production site and uses the same credentials. The only differences are: 1) it has a limited set of ACheckE45
PHN’s available and 2) any claims submission files you send will not be processed for payment. This allows you to
safely exercise your software to confirm it works prior to connecting to the Production site.

## Is there anything else I should know about Teleplan Web Services and State Management?

- When a session is lost or the user is not logged in, your software will still receive a 200 (OK) response. The error text
will be embedded in the response content, but this is not easy to parse. The easiest way to handle this is to simply
check for the existence of the error code in the content. The most common of these is the “User is not logged in or
session expired” response. If you check for this text in the response, you can usually capture most session problems.
- When calling any of the Teleplan Web Services API functions it is very important that you use the correct function
names. ALL the API functions start with the letter “A”. For example, AsignOn, AsignOff, AcheckE45, etc. You MUST
NOT ever call any API function that starts with the letter “W” from your software. HTML screen scraping is not
supported and can result in serious functional problems for you and your customers.
