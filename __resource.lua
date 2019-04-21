-- Script written by FRANkiller13
-- Version 0.0.1

-- Set the resource manifest 
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Add a client script 
client_script {
    'client.lua',
}
server_script {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
}