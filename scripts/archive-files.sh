#!/bin/bash
# Simple file archiver: archive files in a directory that are larger than SIZE (MB)
# or older than AGE (days). Keeps script minimal but correct.

checkNum() {
  local val="$1"
  local name="$2"
  if ! [[ "$val" =~ ^[0-9]+$ ]]; then
    echo "ERROR: ${name} ('$val') is not a non-negative integer." >&2
    exit 1
  fi
}

read -rp "Enter absolute directory path: " path
if [ ! -d "$path" ]; then
  echo "ERROR: Directory doesn't exist: ${path}" >&2
  exit 1
fi

read -rp "Enter threshold size to archive files larger than (MB, e.g. 10): " size
checkNum "$size" "SIZE"

read -rp "Enter threshold age to archive files older than (days, e.g. 7): " age
checkNum "$age" "AGE"

DEPTH=1   # change if you want deeper search
RUN=1     # set to 0 for dry-run (only print actions)

ARCHIVE_DIR="${path%/}/archive"
mkdir -p "$ARCHIVE_DIR"

echo "Searching in: $path (maxdepth=$DEPTH)"
echo "Archiving files with size > ${size}M OR age > ${age} days"
echo "Archive directory: $ARCHIVE_DIR"
echo

# Find files (size OR age). Use -print0 to handle spaces/newlines in names.
find "$path" -maxdepth "$DEPTH" -type f \( -size +"${size}"M -o -mtime +"${age}" \) -print0 |
while IFS= read -r -d '' file; do
  ts=$(date '+%Y-%m-%d %H:%M:%S')
  if [ "$RUN" -eq 1 ]; then
    echo "[$ts] Archiving: $file -> $ARCHIVE_DIR/"
    # Create compressed file then move it; remove original after success.
    if gzip -c -- "$file" > "$file.gz"; then
      if mv -- "$file.gz" "$ARCHIVE_DIR/"; then
        rm -f -- "$file"
      else
        echo "ERROR: failed to move ${file}.gz to ${ARCHIVE_DIR}" >&2
        exit 1
      fi
    else
      echo "ERROR: gzip failed for $file" >&2
      exit 1
    fi
  else
    echo "[$ts] DRY-RUN: would archive: $file -> $ARCHIVE_DIR/"
  fi
done

echo "Successfully Executed."