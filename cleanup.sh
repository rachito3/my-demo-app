#!/bin/bash

# Cleanup script for dependency check
DATA_DIR="$GITHUB_WORKSPACE/dependency-check/data"

cleanup_database() {
    echo "Cleaning up database..."
    rm -f "$DATA_DIR"/*.h2.db
    rm -f "$DATA_DIR"/*.lock.db
    rm -f "$DATA_DIR"/*.trace.db
}

cleanup_cache() {
    echo "Cleaning up cache..."
    rm -rf "$DATA_DIR/cache"
}

main() {
    if [ -d "$DATA_DIR" ]; then
        cleanup_database
        cleanup_cache
        echo "Cleanup completed"
    else
        echo "Data directory not found"
        exit 1
    fi
}

main
