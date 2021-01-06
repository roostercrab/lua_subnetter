local ip_check = require("ip_check")
local mask_check = require("mask_check")
local decimal_to_binary = require("decimal_to_binary")

-- IP Entry
local checked_ip_address = ""
local ip_valid = false
while ip_valid == false do
  io.write('IP address: ')
  local ip_address_to_test = io.read()
  ip_valid = (ip_check.ip_certify_valid(ip_address_to_test))
  if ip_valid == true then
    print("IP is valid")
    checked_ip_address = ip_address_to_test
  end
end

-- Mask Entry
local checked_mask_address = ""
local mask_valid = false
while mask_valid == false do
  io.write('Subnet mask: ')
  local subnet_mask_to_test = io.read()
  mask_valid = mask_check.mask_certify_valid(subnet_mask_to_test)
  if mask_valid == true then
    print("Mask is valid")
    checked_mask_address = subnet_mask_to_test
  end
end

local ip_dec_octet1, ip_dec_octet2, ip_dec_octet3, ip_dec_octet4 = string.match(checked_ip_address, "(.*)%.(.*)%.(.*)%.(.*)")

local ip_bin_octet1 = Decimal_To_Binary.convert(ip_dec_octet1)
local ip_bin_octet2 = Decimal_To_Binary.convert(ip_dec_octet2)
local ip_bin_octet3 = Decimal_To_Binary.convert(ip_dec_octet3)
local ip_bin_octet4 = Decimal_To_Binary.convert(ip_dec_octet4)

local mask_dec_octet1, mask_dec_octet2, mask_dec_octet3, mask_dec_octet4 = string.match(checked_mask_address, "(.*)%.(.*)%.(.*)%.(.*)")
local mask_bin_octet1 = Decimal_To_Binary.convert(mask_dec_octet1)
local mask_bin_octet2 = Decimal_To_Binary.convert(mask_dec_octet2)
local mask_bin_octet3 = Decimal_To_Binary.convert(mask_dec_octet3)
local mask_bin_octet4 = Decimal_To_Binary.convert(mask_dec_octet4)


-- Print IP results
print(checked_ip_address)
print(ip_dec_octet1, ip_dec_octet2, ip_dec_octet3, ip_dec_octet4)
print(ip_bin_octet1, ip_bin_octet2, ip_bin_octet3, ip_bin_octet4)

-- Print Mask results
print(checked_mask_address)
print(mask_dec_octet1, mask_dec_octet2, mask_dec_octet3, mask_dec_octet4)
print(mask_bin_octet1, mask_bin_octet2, mask_bin_octet3, mask_bin_octet4)

