pip list -o --format freeze | ForEach-Object($_) { pip install --upgrade $_.split("==")[0] }