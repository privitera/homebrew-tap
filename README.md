# privitera/tap

Homebrew formulae for small things from [privitera/shareware](https://github.com/privitera/shareware).

```bash
brew tap privitera/tap
```

| Formula | Description |
|---------|-------------|
| [`utc-clock`](./Formula/utc-clock.rb) | macOS menu bar clock showing UTC with seconds; click to copy an ISO-8601 timestamp |

## utc-clock

```bash
brew install privitera/tap/utc-clock
brew services start utc-clock    # start now and at every login
```

Builds from source on your Mac (about 30 seconds), so there are no Gatekeeper warnings. Needs macOS 13 or later.

Uninstall with `brew services stop utc-clock && brew uninstall utc-clock`.
