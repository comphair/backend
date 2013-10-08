group :unit do
  guard 'rspec', :spec_paths => "spec/unit" do
    watch(%r{^spec/unit/.+_spec\.rb$})
  end
end

group :integration do
  guard 'rspec', :spec_paths => "spec/integration" do
    watch(%r{^spec/integration/.+_spec\.rb$})
  end
end
