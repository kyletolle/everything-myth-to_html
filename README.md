# Everything::Collection::ToHtml

Generate a single HTML page for a collection of markdown pieces in your
`everything` repo.

## Setup

Must define these environment variables:

- `EVERYTHING_PATH` - the full path to your everything repo.
- `COLLECTION_RELATIVE_PATH` - the path of the collection, relative
  to `EVERYTHING_PATH` above.
- `HTML_OUTPUT_PATH` - the full path to write the collection's HTML file
- `TEMPLATE_PATH` - the full path of the ERB HTML template to use for the
  collection

## Usage

```
ruby lib/everything/collection/to_html.rb
```

## License

MIT

