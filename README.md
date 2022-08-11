# Localization Effort for the Nix Ecosystem

This is an experimental project to understand the scope of potential localization efforts and implementations. The current implementation consists of [Fluent](https://projectfluent.org/) with support from the [Weblate](https://weblate.org/) project.

Localization:

- The Nix manual (`components/nix-manual`)

## General Notes

### The Nix manual

- We are making use of a patch that integrates Fluent with [mdBook](https://github.com/rust-lang/mdBook).
- The Nix manual includes some preprocessing steps that we are currently ignoring for the sake of simplicity.

## Contributing translations

Translations are hosted by Weblate. If you would like to contribute to the translation effort, please start by going to the [ngi-l10n Weblate project](https://hosted.weblate.org/engage/ngi-l10n/).
