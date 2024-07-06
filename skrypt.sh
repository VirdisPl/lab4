#!/bin/bash

function show_help {
    echo "Usage: $0 [--date | --logs [count] | --init | --error [count] | --help]"
    echo "  --date      Show current date"
    echo "  --logs [n]  Create n log files (default: 100)"
    echo "  --error [n] Create n error files (default: 100)"
    echo "  --init      Clone the repository and set PATH"
    echo "  --help, -h  Show this help message"
    echo "  --logs, -l  Create log files"
    echo "  --error, -e Create error files"
}

function create_logs {
    local count=${1:-100}
    for i in $(seq 1 $count); do
        local filename="log${i}.txt"
        echo "$filename created by $0 on $(date)" > "$filename"
    done
}

function create_errors {
    local count=${1:-100}
    mkdir -p error
    for i in $(seq 1 $count); do
        local filename="error/error${i}.txt"
        echo "$filename created by $0 on $(date)" > "$filename"
    done
}

case "$1" in
    --date | -d)
        date
        ;;
    --logs | -l)
        create_logs $2
        ;;
    --error | -e)
        create_errors $2
        ;;
    --help | -h)
        show_help
        ;;
    --init)
        echo "Clone and set PATH" # Placeholder functionality
        ;;
    *)
        echo "Unknown option: $1"
        show_help
        exit 1
        ;;
esac
