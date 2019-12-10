# Shortcuts

A module to easily jump to directories in powershell.

## How to setup

Place the path nickname and the full path in a data.txt file in this folder (Shortcuts).

These will be in the following JSON format.

```javascript
[
    {
        'nickname': nickname,
        'path': path
    },
    ...
]
```

## How to use

M-Shortcuts will have the alias 'msc'

To run this module, run the following

    msc -Nickname <nickname>

replacing nickname with the nickname you assigned earlier.

To see a list of available paths, use the -All option.