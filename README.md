# Q-SYS Module - Get UCI Names

## Example

See the example file (`Get-UCI-Names-example.qsys`) for a full example!

In addition to `fire_with_UCI_Name` there are two more functions for hooking
into `UCI_Name` changes if you need to do something more dynamic.

See file `init.lua` for more details!

## Init
```lua
local GUN = require('Get-UCI-Names')

GUN.init_UCI_Names()
```

## Run
```lua
local GUN = require('Get-UCI-Names')

function main(UCI_Name)
  print(string.format('This UCI is named: %s', UCI_Name.String))

  Controls.Display_UCI_Name.String = UCI_Name.String
end

GUN.fire_with_UCI_Name(main)

```
