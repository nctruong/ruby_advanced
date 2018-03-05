class S3UploadPolicy
  attr_reader :resource_name, :bucket

  def initialize(resource_name, bucket = AWS_S3_BUCKET)
    @resource_name   = resource_name
    @bucket          = bucket
  end

  def to_json
    {
      key: "#{@resource_name}/#{SecureRandom.uuid}/${filename}",
      AWSAccessKeyId: AWS_ACCESS_KEY_ID,
      acl: "public-read",
      policy: s3_upload_policy_document,
      signature: s3_upload_signature,
      success_action_status: "201"
    }.to_json
  end

  private

  # generate the policy document that amazon is expecting.
  def s3_upload_policy_document
    @s3_upload_policy_document ||= begin
      Base64.encode64(
        {
          expiration: 5.minutes.from_now.utc.xmlschema,
          conditions: [
            { bucket: bucket },
            { acl: 'public-read' },
            ["starts-with", "$key", "#{@resource_name}/"],
            { success_action_status: '201' },
            ["starts-with","$content-type", ""]
          ]
        }.to_json
      ).gsub(/\n|\r/, '')
    end
  end

  # sign our request by Base64 encoding the policy document.
  def s3_upload_signature
    @signature ||= begin
      Base64.encode64(
        OpenSSL::HMAC.digest(
          OpenSSL::Digest::Digest.new('sha1'),
          AWS_SECRET_ACCESS_KEY,
          s3_upload_policy_document
        )
      ).gsub(/\n/, '')
    end
  end
end
