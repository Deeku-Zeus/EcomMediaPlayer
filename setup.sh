#!/bin/bash

echo "Which submodules would you like to clone?"
echo "1. EcomAPI"
echo "2. MediaPlayerBackend"
echo "3. MediaPlayerFrontend"
echo "4. VideoFrameAnalyzer"
echo "5. All"
read -p "Enter your choice (comma-separated): " choice

IFS=',' read -ra ADDR <<< "$choice"

for i in "${ADDR[@]}"; do
    case $i in
        1)
            git submodule update --init --recursive EcomAPI
            ;;
        2)
            git submodule update --init --recursive MediaPlayerBackend
            ;;
        3)
            git submodule update --init --recursive MediaPlayerFrontend
            ;;
        4)
            git submodule update --init --recursive VideoFrameAnalyzer
            ;;
        5)
            git submodule update --init --recursive
            ;;
    esac
done