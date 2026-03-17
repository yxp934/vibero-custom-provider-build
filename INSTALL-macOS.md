# Vibero macOS Installation

Package:
`Vibero-macOS-custom-provider-20260317.zip`

Split release assets:
`Vibero-macOS-custom-provider-20260317.zip.part-00` ... `part-07`

SHA-256:
`640a7e59f657131981b15582f5a7f62dd817d95cc4a90fa6629d6c7e82a95ff5`

## Normal install

1. Download `Vibero-macOS-custom-provider-20260317.zip`.
2. Double-click the zip to extract `Vibero.app`.
3. Drag `Vibero.app` into `/Applications`.

## Split asset install

If the release ships split assets instead of a single zip:

1. Download all `Vibero-macOS-custom-provider-20260317.zip.part-*` files into the same directory.
2. Optionally download `assemble-vibero-macos.sh`.
3. In Terminal, change into the download directory and run:

```bash
chmod +x assemble-vibero-macos.sh
./assemble-vibero-macos.sh
```

If you do not use the script, reassemble manually:

```bash
cat Vibero-macOS-custom-provider-20260317.zip.part-* > Vibero-macOS-custom-provider-20260317.zip
shasum -a 256 Vibero-macOS-custom-provider-20260317.zip
```

The SHA-256 output must match the value at the top of this file.

## First launch on macOS

This build is not signed or notarized.

If macOS blocks it:

1. In Finder, open `/Applications`.
2. Right-click `Vibero.app`.
3. Click `Open`.
4. Click `Open` again in the confirmation dialog.

If macOS still blocks the app, go to:

`System Settings` -> `Privacy & Security`

Then click `Open Anyway` for `Vibero.app`.

If the archive was downloaded with a quarantine flag and macOS reports the app as damaged, run:

```bash
xattr -dr com.apple.quarantine /Applications/Vibero.app
```

Then launch again.

## Important note for Zotero users

Vibero is a Zotero 8 based fork, not a fully separate app family.
If you already use Zotero and want to test Vibero without touching your normal Zotero profile/data, launch it with an isolated profile and data directory:

```bash
mkdir -p "$HOME/ViberoProfile" "$HOME/ViberoData"
open -n /Applications/Vibero.app --args -no-remote -profile "$HOME/ViberoProfile" -datadir "$HOME/ViberoData"
```

## Custom API provider setup

This build includes a built-in Custom Provider GUI for AI Chat and parser-side LLM calls.

Inside the app:

1. Open a PDF in the reader.
2. Open the AI Chat pane.
3. Click `Custom Provider`.
4. Fill in:
   - `API Base URL`
   - `API Key`
   - `Model Name`
5. Click `Save`.

The saved config is used for:

- AI Chat request forwarding
- PDF parsing / article summary LLM calls

## Known platform status

- App bundle: unsigned
- Gatekeeper status: `rejected` because there is no usable signature
- Architecture: universal (`arm64` + `x86_64`)
