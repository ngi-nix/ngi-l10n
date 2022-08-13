# Localization (l10n) for the Nix Ecosystem

This is an experimental project to understand the scope of potential localization implementations. Currently, each component within represents an independent proof-of-concept.

## Components

### Nix manual (`components/nix-manual`)

Implementation:

- [ ] [mdBook](https://github.com/rust-lang/mdBook)
  - [x] [Nix](https://github.com/NixOS/nix) [manual](https://nixos.org/manual/nix/stable/) content
  - [ ] [Fluent](https://projectfluent.org/) integration (related PR: [mdBook #1201](https://github.com/rust-lang/mdBook/pull/1201))
    - [x] Basic integration
    - [x] Multiline strings
    - [ ] Separation of `.ftl` files to correspond to mdBook chapters
    - [ ] Translation validation based on authoritative source[^src]
      - [ ] Basic
      - [ ] Tiered
    - [ ] Diagram integration (e.g., GraphViz, Mermaid)
  - [ ] [Weblate](https://weblate.org/)-hosted translations (portals: [project administration](https://hosted.weblate.org/project/ngi-l10n/), [community engagement](https://hosted.weblate.org/engage/ngi-l10n/))
    - [x] Basic integration
    - [ ] Multiline strings (failing check: `starting newline`)

Notes:

- The Nix manual includes some preprocessing steps that we are currently ignoring for the sake of simplicity.
- For now, we render unordered lists in `.ftl` files by using hyphens (`-`); we presently have issues with asterisks (`*`).

## License

This project is licensed under the terms of the [MIT license](LICENSE.md).

[^src]: Monolingual base language
