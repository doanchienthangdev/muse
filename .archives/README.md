# .archives/ — Your Local Persona Research Vault

This folder is **local-only**. Contents are gitignored so your personal research
stays on your machine.

## Structure

```
.archives/personas/
├── <persona-id>/
│   ├── sources.yaml         # Citation metadata (links, refs, notes)
│   ├── books/               # Book excerpts (PDF/text)
│   ├── transcripts/         # Video/podcast transcripts
│   ├── articles/            # Blog posts, essays
│   └── notes/               # Your own observations
```

## Usage

Feed research material to `muse:build` to create or update a persona:

```bash
# Build a new persona from your research
muse:build --person=custom-thinker --src=.archives/personas/custom-thinker

# Update an existing persona with new material
muse:update --person=feynman --src=.archives/personas/feynman
```

## Git behavior

Only `.gitkeep` and this `README.md` are committed. Subfolders under
`.archives/personas/` are gitignored — your research stays local.

## Privacy note

Nothing from this folder is uploaded or synced by Muse. All processing is local.
