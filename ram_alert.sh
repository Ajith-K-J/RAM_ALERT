#!/bin/bash

# Replace <SLACK_WEBHOOK_URL> with your actual Slack webhook URL
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"

# Get the total and used memory in kilobytes
total_memory=$(free -k | awk 'NR==2{print $2}')
used_memory=$(free -k | awk 'NR==2{print $3}')

# Convert memory values to megabytes
total_memory_mb=$((total_memory / 1024))
used_memory_mb=$((used_memory / 1024))

# Calculate memory usage percentage
memory_usage_percentage=$((used_memory * 100 / total_memory))

# Compose the message
message=":warning: High memory usage alert!\nTotal Memory: ${total_memory_mb} MB\nUsed Memory: ${used_memory_mb} MB\nMemory Usage: ${memory_usage_percentage}%"

# Send the message to Slack
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$message\"}" $SLACK_WEBHOOK_URL
