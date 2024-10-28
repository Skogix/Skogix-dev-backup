#!/bin/bash

# Define the API endpoint
API_URL="https://api.stratz.com/graphiql"

# Define the authorization token
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJTdWJqZWN0IjoiNGI0NWY5YmMtZjYwNC00YTE2LWIyNGEtMmQyNjc2MmE1NWQ2IiwiU3RlYW1JZCI6IjExNjU1MDc0MiIsIm5iZiI6MTczMDE0MzA1MCwiZXhwIjoxNzYxNjc5MDUwLCJpYXQiOjE3MzAxNDMwNTAsImlzcyI6Imh0dHBzOi8vYXBpLnN0cmF0ei5jb20ifQ.dor4ISM3Kt13DJoxTFtAQ6RO9wZrk8bFmgMhdKLvqDE"

# Make the API request
curl -X POST "$API_URL" \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     -H "User-Agent: STRATZ_API" \
     -d '{"query": "{ yourGraphQLQueryHere }"}'
