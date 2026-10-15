# privitera/tap

Homebrew formulae for small tools by [privitera](https://github.com/privitera).

```bash
brew tap privitera/tap
```

| Formula | Description |
|---------|-------------|
| [`utc-clock`](https://github.com/privitera/utc-clock) | macOS menu bar clock showing UTC with seconds; click to copy an ISO-8601 timestamp |

## utc-clock

```bash
brew install privitera/tap/utc-clock
brew services start utc-clock    # start now and at every login
```

Builds from source on your Mac (about 30 seconds), so there are no Gatekeeper warnings. Needs macOS 13 or later.

Uninstall with `brew services stop utc-clock && brew uninstall utc-clock`.

## License

[MIT](./LICENSE)
