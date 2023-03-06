MockMyID
========

MockMyID was a Mozilla Persona Identity Provider (IdP) that gladly issued identity certificates to anyone and everyone, without a second thought.

It was like Mailinator, for Persona.

(All email sent to mockmyid.com addresses was delivered and readable at mailinator.com!)

MockMyID made it easy to test and demo sites that used Persona.

How Do I Use It?
----------------

Whenever you were asked to log in with Persona, you could make up any email address you want `@mockmyid.com`.

Deployment Notes
----------------

This is a completely static site; the `public_html/` directory is the document root.

Requests for `/.well-known/browserid` should include a `Content-Type: application/json` response header.
