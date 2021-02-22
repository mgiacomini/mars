# Mars

Starting exploring Mars :)

## Architecture

The domain is located in lib/mars.ex file and lib/mars directory.
The `Mars` module exposes an imperative shell to our domain functionality. (imperative shell/functional core concept).

The application layer is located in lib/cli.ex and lib/cli directory.

## Testing the application

```sh
mix test
```

## Running the application

```sh
mix mars.run path/to/file.txt
```