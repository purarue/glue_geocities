This is my personal website [glue](https://github.com/purarue/glue) converted from elixir to a static site at [this commit](https://github.com/purarue/glue/tree/b163eec87183a32758f786363a99b91fe6009eda) circa ~July 2020

It has [since evolved to something else](https://purarue.xyz/), but I wanted to have a working version of this up somewhere

This was not actually hosted on [geocities](https://en.wikipedia.org/wiki/GeoCities) (I'm a bit too young for that), it was inspired by:

- https://www.cameronsworld.net/
- https://gifcities.org/
- https://twitter.com/geocitiesbot

This also included [an old version of my feed](https://purarue.xyz/feed/) which [look like this](https://github.com/purarue/glue_geocities/blob/main/.github/old_feed.png?raw=true), but re-implementing that as a static site without an API (which doesnt exist anymore, [was a bunch of genservers in elixir which cached the data](https://github.com/purarue/glue/tree/408d738439f05ef4797133f69114d28800710537/lib/glue/feed))

Live at <https://purarue.xyz/geocities/>

<img src="https://github.com/purarue/glue_geocities/blob/main/.github/screenshot.png?raw=true" />

### Requires:

- [`elm`](https://elm-lang.org/)

### Build:

```
make build
make
```

Outputs a static site to `./dist`
