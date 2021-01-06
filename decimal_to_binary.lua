Decimal_To_Binary = {}

-- local binary_octet_completed = {}

function Decimal_To_Binary.convert(decimal_string)
  local decimal_value = tonumber(decimal_string)
  local powers_of_two = {128, 64, 32, 16, 8, 4, 2, 1}
  local binary_octet = {}
  for _, power_of_two in ipairs(powers_of_two) do
    if decimal_value >= power_of_two then
      table.insert(binary_octet, "1")
      decimal_value = decimal_value - power_of_two
    else
      table.insert(binary_octet, "0")
    end
  end
  return (table.concat(binary_octet))
end

-- io.write('Decimal number: ')
-- local decimal_string = io.read()
-- binary_octet_completed = Decimal_To_Binary.convert(decimal_string)

-- print(table.concat(binary_octet_completed))

return Decimal_To_Binary