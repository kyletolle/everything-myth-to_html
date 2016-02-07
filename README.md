# Everything::Myth::ToHtml

Generate an HTML site for a myth of markdown pieces in your `everything` repo.

## Setup

Must define these environment variables:

- `EVERYTHING_PATH` - the full path to your everything repo.
  to `EVERYTHING_PATH` above.
- `HTML_OUTPUT_PATH` - the full path to write the myth's HTML files
- `TEMPLATE_PATH` - the full path of the ERB HTML template to use for the
  myth

## Usage

```
bin/em generate your-myth-name-here
```

Make it easier to use by putting this in your .zshrc:

```
# For everything-myth-to_html
export PATH=$PATH:/Users/kyle/Dropbox/code/kyletolle/everything-myth-to_html/bin
alias em="BUNDLE_GEMFILE=/Users/kyle/Dropbox/code/kyletolle/everything-myth-to_html/Gemfile bundle exec em ${@:2}"
```

## Viewing

To see the html output in the browser, from the root of this project do:

```
http-server output 3000
```

## License

MIT

