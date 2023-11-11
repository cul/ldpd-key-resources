class KeyResource < ApplicationRecord
  default_scope { order(title: :asc) }

  strip_attributes collapse_spaces: true
  before_validation :hash_url
  before_save :convert_null_description_to_string

  validates :title, presence: true, uniqueness: true
  # We don't have a unique index on the url field in the database because it's
  # an index key for a single-column index can be up to 767 bytes. We want to
  # allow long urls, so url is a text field and we hash the url value in the
  # url_hash field. The url_hash field has a unique index in the database and
  # will always be under the 767 byte limit.
  validates :url, presence: true, uniqueness: {scope: :url_hash}
  validates :contexts, presence: true
  validates :description, length: { maximum: 255 }

  def hash_url
    return nil if self.url.nil?
    self.url_hash = Digest::SHA256.hexdigest(self.url)
  end

  def convert_null_description_to_string
    self.description = '' if self.description.nil?
  end
end
