#!/bin/sh

# define all the prerequisites of shell commands that must exist before executing the setup.
# this is a string of command names separated by a space character.
prerequisites="git";

# assert that the required commands are installed.
for command_name in $(echo "$prerequisites" || cut -d ' ')
do
    if ! command_location=$(command -v "$command_name") || [ -z "$command_location" ]; then
        echo "failed to find '$command_name', please make sure that '$command_name' command is installed.";
        exit 1;
    fi
done

# setup git configurations.
git config --local include.path ../.gitconfig

