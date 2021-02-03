require "active_support"
require "amakanize/filters/base_filter"

module Amakanize
  module Filters
    class NormalizationFilter < ::Amakanize::Filters::BaseFilter
      # @note Override
      # @param output [String] e.g. `"ぽんかん（８）"`, `"ぽんかん⑧"`
      # @return [Hash] e.g. `"ぽんかん(8)"`, `"ぽんかん8"`
      def call(context:, output:)
        normalized =
        if RUBY_VERSION >= "2.5"
          output.unicode_normalize(:nfkc)
        elsif ::ActiveSupport::Multibyte::Unicode.respond_to?(:normalize)
          ::ActiveSupport::Multibyte::Unicode.normalize(output)
        end

        {
          context: context,
          output: normalized,
        }
      end
    end
  end
end
