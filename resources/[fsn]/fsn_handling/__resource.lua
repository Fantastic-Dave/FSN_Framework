resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

dependency "fsn_builders"
fsn_handling "src/schafter.lua"

files { 'out/handling.meta', 'data/handling.meta' }
data_file 'HANDLING_FILE' 'out/handling.meta'
data_file 'HANDLING_FILE' 'data/handling.meta'
