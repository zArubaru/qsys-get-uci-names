# Q-SYS Module - Get UCI Names

This Lua module makes it possible to dynamically fetch the current UCI's name in the UCI's script.

The only requirement is, that the UCI has to have an (initially empty) `string UCI_Name` variable defined,
which will be populated by this module.

## Example

See the example file (`Get-UCI-Names-example.qsys`) for a full example!

In addition to `fire_with_UCI_Name` there are two more functions for hooking
into `UCI_Name` changes if you need to do something more dynamic.

See file `init.lua` for more details!

## Init
```lua
local GUN = require('Get-UCI-Names')

-- Run this once _anywhere_ in your Design.
GUN.init_UCI_Names()
```

## Run
```lua
local GUN = require('Get-UCI-Names')

function main(UCI_Name)
  print(string.format('This UCI is named: %s', UCI_Name.String))

  Controls.Display_UCI_Name.String = UCI_Name.String
end

-- Run this in your UCI script.
GUN.fire_with_UCI_Name(main)

```
