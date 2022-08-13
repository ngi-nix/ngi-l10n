# Localization (l10n) for the Nix Ecosystem

This is an experimental project to understand the scope of potential localization implementations. Currently, each component within represents an independent proof of concept.

## Components

### Nix manual (`components/nix-manual`)

#### Concept

This is a novel experiment to apply to long-format documents the general l10n approach standardized by projects such as GNU gettext.

Presently, there appears to be no consensus on how to effectively provide long-format documentation with up-to-date translations. Most organizations seem to treat localized manuals as separate projects entirely (often resulting in no l10n effort at all).

Because gettext itself is considered too granular and inflexible for the use case, the general approach is widely dismissed as inappropriate as well. This project proposes a reconciliation of the approach with the use case by implementing a modern l10n system capable of presenting a long-format l10n project (such as a technical manual) as a collection of semantic informational blocks—atomic units of knowledge containing all (and only) the context necessary to provide a high-quality translation. A typical example of such a unit is a section containing a heading and one or more paragraphs (of prose, code fences, diagrams, etc.). The resulting overall structure is as intuitive as that of the source content. For example:

- A document (e.g., “book”) is comprised of one or more chapters.
- A chapter (e.g., “page”/single file) is comprised of one or more (typically up to ~10) atomically translatable units.

By enforcing a reasonably strict invalidation policy of translated units based on source content (i.e., authoritative units produced in a given project’s monolingual base language), all end user-facing translations are guaranteed to be either as up-to-date as the source content or altogether excluded (defaulting instead to the source content itself). This has the additional benefit of transparently representing the current state of the l10n effort in a given locale, implicitly prompting readers to contribute where applicable. (Note: as an UI enhancement for documentation published as a static site, such a prompt could be made explicit with a “translate this section” CTA in the corner of each unit.)

Contributing policy recommendations:

- Translators should be fluent enough in the project’s monolingual base language to contribute direct translations (as opposed to [translations of other translations](https://en.wikipedia.org/wiki/Chinese_whispers)).

#### Implementation

- [ ] [mdBook](https://github.com/rust-lang/mdBook)
  - [x] [Nix](https://github.com/NixOS/nix) [manual](https://nixos.org/manual/nix/stable/) content
  - [ ] [Fluent](https://projectfluent.org/) integration (related PR: [mdBook #1201](https://github.com/rust-lang/mdBook/pull/1201))
    - [x] Basic integration
    - [x] Multiline strings
    - [ ] Separation of `.ftl` files to correspond to mdBook chapters
    - [ ] Translation invalidation based on UID of authoritative source string of monolingual base language ([wiki reference](https://github.com/projectfluent/fluent/wiki/Fluent-vs-gettext#translation-invalidation))
    - [ ] Diagram integration (e.g., GraphViz, Mermaid)
- [ ] [Weblate](https://weblate.org/)-hosted translations (portals: [project administration](https://hosted.weblate.org/project/ngi-l10n/), [community engagement](https://hosted.weblate.org/engage/ngi-l10n/))
  - [x] Basic integration
  - [ ] Multiline strings (failing check: `starting newline`)
  - [ ] Continuous integration
  - [ ] Machine-translated suggestions[^machine-translations]
  - [ ] Notification of invalidated strings

[^machine-translations]: Machine translation is not yet accurate enough for full automation; the possibility of generating output with distorted meaning poses an unacceptable risk to readers of an official manual (and any technical instructions presented therein). Therefore, it is critical that any machine-translation content be human-reviewed prior to submission. (Note: while project maintainers generally are unable to confirm accuracy of all human-contributed translations, contributor codes of conduct foster a minimum level of accountability that brings greater assurance of accuracy than machines are presently capable of providing.)

#### Notes

- The Nix manual includes some preprocessing steps that we are currently ignoring for the sake of simplicity.
- For now, we render unordered lists in `.ftl` files by using hyphens (`-`); we presently have issues with asterisks (`*`).

## License

This project is licensed under the terms of the [MIT license](LICENSE.md).
