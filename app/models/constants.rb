module Constants
  module SleepRecordStatus
    INITIALIZED = 0
    COMPLETED = 2
  end

  class << self
    Constants.constants.each do |module_name|
      sub_module = Constants.const_get(module_name)
      next unless sub_module.is_a?(Module)

      define_method(module_name.to_s + 'Values') do
        sub_module.constants.collect { |const_name| sub_module.const_get(const_name) }
      end
    end
  end
end
