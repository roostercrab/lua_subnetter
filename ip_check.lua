IP_Check = {}

-- Verify IP Validity
-- make sure that each octet is between 0 and 255
function IP_Check.check_ip_octet(octet)
  local integer_octet = tonumber(octet)
  if integer_octet >= 0 and integer_octet <= 255 then
    return true
  else
    return false
  end
end

function IP_Check.ip_certify_valid(ip_address_to_test)
  local ip_dec_octet1, ip_dec_octet2, ip_dec_octet3, ip_dec_octet4 = string.match(ip_address_to_test, "(.*)%.(.*)%.(.*)%.(.*)")
  local ip_table = {ip_dec_octet1, ip_dec_octet2, ip_dec_octet3, ip_dec_octet4}
  for _, octet in ipairs(ip_table) do
      local octet_validity = IP_Check.check_ip_octet(octet)
      if octet_validity == false then
        print("That IP address won't work sucka")
        return false
      end
  end
  return true
end

return IP_Check