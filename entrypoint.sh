#!/bin/sh

if [ -f /slidev/slides.md ]; then
    if [ -d /slidev/package.json ]; then
        npm ci
    else
        npm install @slidev/cli @slidev/theme-default @slidev/theme-seriph
    fi
    echo "Start slidev..."

else
    echo "slides.md not found in the bind mount to /slidev"
    npm install @slidev/cli @slidev/theme-default @slidev/theme-seriph
    cp -f /slidev/node_modules/@slidev/cli/template.md /slidev/slides.md

fi

npx slidev --remote $SLIDEV_PASS
