# Vibero Custom Provider Build

Date:
`2026-03-17`

Package:
`Vibero-macOS-custom-provider-20260317.zip`

SHA-256:
`640a7e59f657131981b15582f5a7f62dd817d95cc4a90fa6629d6c7e82a95ff5`

## What changed

- Added a built-in `Custom Provider` GUI in the AI Chat iframe.
- Saved custom provider config is stored in `aiChat.customModelConfig`.
- AI Chat proxy requests can now be forwarded to a user-defined OpenAI-compatible endpoint.
- Parser-side LLM calls in `pdfParsing/LLMApi/llmapi.js` also reuse the same custom provider config.
- Removed temporary self-test hooks used during bring-up.

## Verified

- GUI save flow writes `aiChat.customModelConfig`.
- Forwarding verification successfully reached a local OpenAI-compatible mock endpoint.
- The forwarded request used the configured model name: `mock-gui-model`.

## Distribution note

This build is unsigned and not notarized, so macOS users should follow the instructions in `INSTALL-macOS.md`.
