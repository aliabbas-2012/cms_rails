json.array!(@test_boot_straps) do |test_boot_strap|
  json.extract! test_boot_strap, :id, :title, :description
  json.url test_boot_strap_url(test_boot_strap, format: :json)
end
