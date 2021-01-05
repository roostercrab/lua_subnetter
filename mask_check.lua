Mask_Check = {}

-- Verify Mask Validity
local possible_masks = {0, 128, 192, 224, 240, 248, 252, 254}

-- check if octet is 255, if yes check next, if no go through table of other possible masks and set need_to_be_zeroes to true
function Mask_Check.check_mask_octet(octet, needs_to_be_zero)
  local integer_octet = tonumber(octet)

  if integer_octet == 255 and needs_to_be_zero == false then
    -- print("That's a 255, checking next one")
    return true, false

  elseif integer_octet ~= 255 and needs_to_be_zero == false then
    for _, value in ipairs(possible_masks) do
      -- print("Not a 255, but I'll check through the list of possible masks")
      -- print(value)
      if integer_octet == value then
        return true, true
      end
    end

  elseif needs_to_be_zero == true then
    if integer_octet == 0 then
      -- print("All good, that is a 0 when it should be!")
      return true, true
    else
      -- print("This needed to be a 0")
      return false, false
    end

  else
    -- print("You've hit the default deny friend, one of your numbers was invalid")
    return false, false
  end

end

function Mask_Check.mask_certify_valid(subnet_mask_to_test)
  local mask_dec_octet1, mask_dec_octet2, mask_dec_octet3, mask_dec_octet4 = string.match(subnet_mask_to_test, "(.*)%.(.*)%.(.*)%.(.*)")
  local mask_table = {mask_dec_octet1, mask_dec_octet2, mask_dec_octet3, mask_dec_octet4}
  local needs_to_be_zero = false
  local octet_validity = true
  for _, octet in ipairs(mask_table) do
      octet_validity, needs_to_be_zero = Mask_Check.check_mask_octet(octet, needs_to_be_zero)
      if octet_validity == false then
        print("That mask won't work sucka")
        return false
      end
  end
  return true
  end

return Mask_Check