module JsonEncoding
  extend ActiveSupport::Concern

  module ClassMethods
    def json_encode(attribute, options = {})
      decoded_attribute = options[:as] || :"#{attribute}_hash"

      define_method decoded_attribute do
        begin
          instance_variable_get(:"@#{decoded_attribute}") ||
            instance_variable_set(:"@#{decoded_attribute}", JSON.parse(self.send(attribute)))
        rescue
          {}
        end
      end

      define_method :"#{decoded_attribute}=" do |value|
        self.send(:"#{attribute}=", value.try(:to_json))
      end
    end
  end
end
