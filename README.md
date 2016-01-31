# Everything::Myth::ToHtml

Generate an HTML site for a myth of markdown pieces in your `everything` repo.

## Setup

Must define these environment variables:

- `EVERYTHING_PATH` - the full path to your everything repo.
- `MYTH_RELATIVE_PATH` - the path of the myth, relative
  to `EVERYTHING_PATH` above.
- `HTML_OUTPUT_PATH` - the full path to write the myth's HTML files
- `TEMPLATE_PATH` - the full path of the ERB HTML template to use for the
  myth

## Usage

```
ruby lib/everything/myth/to_html.rb
```

## Viewing

To see the html output in the browser, from the root of this project do:

```
http-server output 3000
```

## License

MIT

