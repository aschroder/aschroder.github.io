#!/bin/bash

# Wait for bundle install to complete if still running
while pgrep -f "bundle install" > /dev/null; do
    echo "Waiting for bundle install to complete..."
    sleep 2
done

# Start Jekyll server
echo "Starting Jekyll server..."
cd /workspaces/$(basename "$GITHUB_REPOSITORY" 2>/dev/null || echo "aschroder.github.io")

# Start Jekyll in background
nohup bundle exec jekyll serve --host 0.0.0.0 --livereload --port 4000 > /tmp/jekyll.log 2>&1 &

echo "Jekyll server started! Check /tmp/jekyll.log for logs."
echo "Preview will be available at the forwarded port 4000."