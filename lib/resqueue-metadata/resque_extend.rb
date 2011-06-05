# We have to monkey patch Resque directly to re-define the method. Including a module doesn't work.
module Resque
  # Keep the old implementation around to call
  alias_method :original_remove_queue, :remove_queue

  # Given a queue name, completely deletes the queue and any associated metadata
  def remove_queue name
    # Let the default implementation remove the queue
    original_return_value = original_remove_queue(name)
    # And now remove the metadata for this queue
    redis.del Resque::Queue::Metadata.metadata_key(name)
    return original_return_value
  end

end
