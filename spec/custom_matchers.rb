require 'spec_helper'

RSpec::Matchers.define :require_presence_of do |attribute|
  match do |actual|
    object = actual.is_a?(Class) ? actual.new : actual
    object.send(:"#{attribute}=", nil)
    not_valid_for_nil_value = !object.valid?
    errors_on_validated_attribute = object.errors[attribute].any?

    not_valid_for_nil_value && errors_on_validated_attribute
  end

  match_when_negated do |actual|
    object = actual.is_a?(Class) ? actual.new : actual
    object.send(:"#{attribute}=", nil)
    object.valid?
    object.errors[attribute].empty?
  end
end
