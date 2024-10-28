#!/bin/bash

# Define the API endpoint
API_URL="https://api.stratz.com/graphql"

# Define the authorization token
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJTdWJqZWN0IjoiNGI0NWY5YmMtZjYwNC00YTE2LWIyNGEtMmQyNjc2MmE1NWQ2IiwiU3RlYW1JZCI6IjExNjU1MDc0MiIsIm5iZiI6MTczMDE0MzA1MCwiZXhwIjoxNzYxNjc5MDUwLCJpYXQiOjE3MzAxNDMwNTAsImlzcyI6Imh0dHBzOi8vYXBpLnN0cmF0ei5jb20ifQ.dor4ISM3Kt13DJoxTFtAQ6RO9wZrk8bFmgMhdKLvqDE"

# Make the API request
curl -X POST "$API_URL" \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" \
     -d '{"query": "{ yourGraphQLQueryHere }"}'
