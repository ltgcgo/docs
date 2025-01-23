#!/bin/bash
tree -ifl $1 | grep -E "\.(gz|br)$" | while IFS= read -r file; do
	rm -v "$file"
done