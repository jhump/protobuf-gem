require 'protobuf/generators/base'

module Protobuf
  module Generators
    class OptionGenerator < Base
      def compile
        run_once(:compile) do
          descriptor.each_field.map do |field, value|
            next if field.default_value == value
            serialized_value = serialize_value(value)
            puts "set_option #{field.name.inspect}, #{serialized_value}"
          end
        end
      end
    end
  end
end
