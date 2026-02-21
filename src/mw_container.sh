#!/bin/bash
set -euo pipefail

function run_mw() {
    if [[ ! -f /run/.containerenv ]]; then
        if ! command -v steamcmd &> /dev/null; then
            echo "Error: steamcmd is not installed. Exiting..."
            exit 1
        fi
        echo "Running script inside ModularWork image"
    fi
}