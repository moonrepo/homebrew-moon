# Moonrepo Moon


```shell
brew tap moonrepo/tap
brew install moonrepo/tap/moon
```



## Development of moon homebrew formula:

### Building bottles

Most bottles can be built with the Github actions, but the MacOS 13 versions need to be built locally and added to the other versions.

#### Step 1: Update the base formula

```
cd $(brew --repository)/Library/Taps/moonrepo/homebrew-tap
```

1. Update moon.rb with the correct `url` and `sha256`
2. Remove the `bottle` block. The PR will add it back in once it's built.
3. Make a PR

#### Step 2: (while the PR is building) Build a bottle locally on a MacOS 13 machine

```
cd $(brew --repository)/Library/Taps/moonrepo/homebrew-tap
brew install moonrepo/tap/moon --build-bottle
brew bottle moonrepo/tap/moon
```

#### Step 3: Merge base PR

Use the `pr-pull` tag to merge the PR

#### Step 4: Upload locally built bottle

Go to the release: https://github.com/moonrepo/homebrew-moon/releases and upload the bottle as a new asset.

#### Step 5: Add another PR with the new bottle asset.

Example PR: https://github.com/moonrepo/homebrew-moon/pull/2/files




