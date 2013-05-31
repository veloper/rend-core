module Rend
  module Core
    module Helpers
      module Php

        # Replicate PHP Type Hinting
        #
        # function juice(Fruit $orange, PulpType $pulp = nil)
        #
        # => Can not we written as...
        #
        # def juice(orange, pulp)
        #   type_hint! Fruit,     orange, :is_required => true
        #   type_hint! PulpType,  pulp
        # end
        def type_hint!(klass, obj, options = {})
          is_required = options.fetch(:is_required, false)
          return nil if !is_required && obj.nil?
          # Should throw exception up the chain from the class it's mixed into.
          exception = self.class.const_defined?("Exception") ? self.class.const_get("Exception") : Rend::Core::Exception
          unless obj.class <= klass
            raise exception, "PHP TypeHint: #{obj.class.name} is not an instance of #{klass.name}"
          end
        end

      end
    end
  end
end