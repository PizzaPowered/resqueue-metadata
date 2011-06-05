module Resque
  class Queue
    class Metadata
      attr_reader :queue_name

      def self.metadata_key queue_name
        "metadata:#{queue_name}"
      end

      def initialize queue_name
        self.queue_name = queue_name
      end

      def to_h
        hash_key.all
      end

      def method_missing meffod, *args
        if hash_key.respond_to? meffod
          hash_key.send meffod, *args
        else
          super
        end
      end

      def respond_to? meffod
        return true if hash_key.respond_to? meffod
        super
      end

    protected
      attr_writer :queue_name

      def hash_key
        @hash_key ||= Redis::HashKey.new(metadata_key, redis)
      end

      def redis
        Resque.redis
      end

      def metadata_key
        self.class.metadata_key queue_name
      end

    end
  end
end
