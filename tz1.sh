#!/bin/bach
process_dir() {
        local dir="$1"
        for entity in "$dir"/*; do
                if [ -d "$entity" ]; then
                        process_dir "$entity"
                elif [ -f "$entity" ]; then
                        old_name=$(basename "$entity")
                        new_name="$out_dir/$old_name"
                        if [ -e "$new_name" ]; then
                                new_name="$out_dir/different_dir_$old_name"
                        fi
                        cp -R "$entity" "$new_name"
                fi
        done
}
from_dir="$1"
out_dir="$2"
process_dir "$from_dir"
