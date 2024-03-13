require 'rom/schema'

module ROM
  module Mongo
    class Schema < ROM::Schema
      # @api public
      def call(relation)
        relation.new(relation.dataset.only(map(&:name)), schema: self)
      end

      def to_output_hash
        Types::Hash
          .schema(map { |attr| [attr.key, attr.to_read_type] }.to_h)
          .with_key_transform(&:to_sym)
      end
    end
  end
end
