#!/bin/bash

# Elasticsearch settings array (-a)
declare -a es_settings

# Iterate over env variables
# (IFS='=' means words separator is '=')
while IFS='=' read -r env_key env_val; do

    # Check if key matches (=~) 'word_1.word_2' as expected by
    # valid Elasticsearch settings
    if [[ "$env_key" =~ ^[a-z]+\.[a-z]+ ]]; then

        # Check if value is not empty (! -z)
        if [[ ! -z $env_val ]]; then
          # Both key and value seems valid, nice!
          # Store it prefixing with '-E' (docs about it are almost hidden)
          es_settings+=("-E${env_key}=${env_val}")
        fi

    fi

done < <(env)

# Ready to run passing settings as parameters
exec bin/elasticsearch "${es_settings[@]}"
