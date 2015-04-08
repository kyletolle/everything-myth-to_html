# Everything::Collection::ToHtml

This is for generating a single HTML page for a collection of poetry in
multiple markdown files.

This project assumes you have an `everything` project.

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

