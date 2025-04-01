# frozen_string_literal: true

module CMSScanner
  module Finders
    # Independent Finder
    module IndependentFinder
      extend ActiveSupport::Concern

      # See ActiveSupport::Concern
      module ClassMethods
        def find(target, opts = {})
          new(target).find(opts)
        end
      end

      # @param [ Hash ] opts
      # @option opts [ Symbol ] mode (:mixed, :passive, :aggressive)
      #
      # @return [ Findings ]
      def find(opts = {})
        finders.run(opts)
      end

      # @return [ Array ]
      def finders
        @finders ||= NS::Finders::IndependentFinders.new
      end
    end
  end
end
