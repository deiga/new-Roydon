require 'digest/md5'

module Caching
  def cache_key
    Digest::MD5.hexdigest "#{max(:updated_at)}.try(:to_i)-#{count}"
  end
end
