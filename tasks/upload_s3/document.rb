class Document < ApplicationRecord

  attr_accessor :file_field # original file from file_field_tag
  before_validation :upload_s3

  enum status: [:uploaded, :ready, :fail]

  belongs_to :evaluation

  validates :path, presence: true

  module ClassMethods
    def presigned_url(ext)
      path = random_file_path('temp', ".#{ext}")
      url  = bucket.object(path).presigned_url(:put)
      return path, url
    end

    def bucket
      Aws::S3::Resource.new.bucket(ENV['AWS_S3_BUCKET'])
    end

    def random_file_path(dir, ext)
      begin
        path = "#{dir}/#{random_file_name(ext)}"
      end while check_if_exists?(path)
      path
    end

    def random_file_name(ext)
      "#{SecureRandom.hex(64)}#{ext}"
    end

    def check_if_exists?(path)
      Aws::S3::Client.new.head_object(bucket: ENV['AWS_S3_BUCKET'], key: path).present?
    rescue
      false
    end
  end
  extend ClassMethods

  def ext
    File.extname(path)
  end

  def base
    File.basename(path, ext)
  end

  def dir
    File.dirname(path)
  end

  def upload_s3
    if file_field.present?
      self.path = Document.random_file_path('documents', File.extname(file_field.path))
      aws = Document.bucket.put_object(key: self.path, body: file_field, acl: 'public-read')
      self.path = aws.key
      self.name = file_field.original_filename
      self.status = Document.statuses[:uploaded]
    end
  end

  def original_url
    Document.bucket.object(path).public_url.to_s unless path.nil?
  end
end
