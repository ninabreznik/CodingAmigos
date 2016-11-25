[![NPM Package](https://badge.fury.io/js/semver-match.svg)](https://www.npmjs.com/package/semver-match)
[![Build Status](https://travis-ci.org/vilic/semver-match.svg)](https://travis-ci.org/vilic/semver-match)

# Semver Match

A simple function that conforms npm package version matching behavior.

## Install

```sh
npm install semver-match --save
```

## Usage

```ts
import match from 'semver-match';

match('^0.1.0', ['0.1.0', '0.1.1', '0.2.0']); // "0.1.1"
match('*', ['0.1.0', '0.2.0'], { latest: '0.1.0' }); // "0.1.0"
match('next', ['0.1.0', '0.2.0'], { latest: '0.1.0', next: '0.2.0' }); // "0.2.0"
```

## License

MIT License.
