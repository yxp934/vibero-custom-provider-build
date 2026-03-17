# Vibero Custom Provider Source Changes

This repository includes the final retained source changes for the custom API provider build.

## Modified files

- `patches/ai-chat-iframe.html`
- `patches/llmapi.js`

## Original target paths inside Vibero / Zotero fork

- `chrome/content/zotero/ai-chat-iframe.html`
- `chrome/content/zotero/xpcom/pdfParsing/LLMApi/llmapi.js`

## What these changes do

- Add a built-in `Custom Provider` GUI in the AI Chat iframe.
- Persist the user config in `aiChat.customModelConfig`.
- Forward AI Chat requests to a user-defined OpenAI-compatible endpoint.
- Reuse the same custom provider config for parser-side LLM calls.

## Packaging note

The packaged macOS app archive was built and verified locally, but GitHub-hosted binary upload was blocked in this environment by repeated upstream `broken pipe` failures during large-object transfer.
