Dotted_Dec_To_Bin = {}

local bin_octet_completed = {}

function Dotted_Dec_To_Bin.convert(dec_string)
  local dec_value = tonumber(dec_string)
  local powers_of_two = {128, 64, 32, 16, 8, 4, 2, 1}
  local bin_octet = {}
  for _, power_of_two in ipairs(powers_of_two) do
    if dec_value >= power_of_two then
      table.insert(bin_octet, "1")
      dec_value = dec_value - power_of_two
    else
      table.insert(bin_octet, "0")
    end
  end
  return bin_octet
end

io.write('Decimal number: ')
local dec_string = io.read()
bin_octet_completed = Dotted_Dec_To_Bin.convert(dec_string)

print(table.concat(bin_octet_completed))

return Dotted_Dec_To_Bin