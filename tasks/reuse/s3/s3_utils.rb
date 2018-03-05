module S3Utils
  module_function

  # small files (< 5MB) are downloaded in a single API call
  # large files are split into parts
  # and the parts are downloaded in parallel
  def dowload_file(key:, bucket_name:, access_key_id:, secret_access_key:, region:, destination:)
    creds = Aws::Credentials.new(access_key_id, secret_access_key)
    s3_client = Aws::S3::Client.new(region: region, credentials: creds)
    bucket = Aws::S3::Bucket.new(name: bucket_name, client: s3_client)
    destination if bucket.object(key).download_file(destination)
  end

  def download(key, bucket_name, file_path)
    bucket = butket_for(bucket_name)
    object = bucket.object(key)
    object.get(response_target: file_path)
    file_path
  end

  def public_access(key, bucket_name, expires_in = 1800)
    butket_for(bucket_name).object(key)
                           .presigned_url(
                             :put,
                             acl: 'public-read',
                             expires_in: expires_in
                           )
  end

  def public_url(key, bucket_name, expires_in = 1800)
    butket_for(bucket_name).object(key)
                           .presigned_url(:get, expires_in: expires_in)
  end

  private

  module_function

  def butket_for(bucket_name)
    Aws::S3::Resource.new.bucket(bucket_name)
  end
end
