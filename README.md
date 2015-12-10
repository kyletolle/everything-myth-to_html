# Everything::Novel::ToHtml

Generate a single HTML page for a novel of markdown pieces in your
`everything` repo.

## Setup

Must define these environment variables:

- `EVERYTHING_PATH` - the full path to your everything repo.
- `NOVEL_RELATIVE_PATH` - the path of the novel, relative
  to `EVERYTHING_PATH` above.
- `HTML_OUTPUT_PATH` - the full path to write the novel's HTML files
- `TEMPLATE_PATH` - the full path of the ERB HTML template to use for the
  novel

## Usage

```
ruby lib/everything/novel/to_html.rb
```

## Viewing

To see the html output in the browser, from the root of this project do:

```
http-server output 3000
```

## License

MIT

