module Amakanize
  class AuthorName
    # @param raw [String]
    def initialize(raw)
      @raw = raw
    end

    # @todo
    # @note Override
    def to_s
      @raw
    end
  end
end