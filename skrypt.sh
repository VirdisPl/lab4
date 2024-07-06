#!/bin/bash

function show_help {
    echo "Usage: $0 [--date | --logs [count] | --help]"
    echo "  --date      Show current date"
    echo "  --logs [n]  Create n log files (default: 100)"
    echo "  --help      Show this help message"
}

function create_logs {
    local count=${1:-100}
    for i in $(seq 1 $count); do
        local filename="log${i}.txt"
        echo "$filename created by $0 on $(date)" > "$filename"
    done
}

case "$1" in
    --date)
        date
        ;;
    --logs)
        create_logs $2
        ;;
    --help)
        show_help
        ;;
    *)
        echo "Unknown option: $1"
        show_help
        exit 1
        ;;
esac
