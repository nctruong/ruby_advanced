##
# Backup current database to S3
# Restore database from S3 (Warning: current data will be replaced by backup data)
# ENV variables required
# AWS_S3_BUCKET
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_REGION
#
require "shellwords"

class DbBackup

  attr_reader :config, :bucket

  def initialize
    @config = ActiveRecord::Base.connection_config
    @bucket = FileStore.bucket
  end

  # main method
  def backup
    file_path = backup_db
    upload_to_s3 file_path
    remove_file file_path
  end

  # main method
  def restore(rev = list.last.try(:key))
    file = download_from_s3(rev)
    restore_db(file)
    remove_file file
  end

  def list
    @list ||= bucket.objects(prefix: s3_prefix).to_a
  end

  private

  def restore_cmd
    Shellwords.escape(`which pg_restore`.strip)
  end

  def backup_cmd
    Shellwords.escape `which pg_dump`.strip
  end

  def pg_restore  host:, port:, database:,
                  username:, password:,
                  in_file:

    raise 'Database is required' if database.blank?
    cmd = restore_cmd
    raise "pg_restore command not found" if cmd.blank?

    cmd << " -Ft -c -v"
    {h: host, p: port, d: database,
      U: username}.each do |name, value|
        cmd << " -#{name} #{Shellwords.escape(value)}" if value.present?
      end
     `PGPASSWORD=#{Shellwords.escape(password)} #{cmd} #{Shellwords.escape(in_file)}`
  end

  def download_from_s3(key)
    #key     = to_s3_file_name(file_name)
    object  = bucket.object(key)
    object.get(response_target: file_path)
    file_path
  end

  def backup_db
    pg_dump   host: config[:host],
               port: config[:port],
               database: config[:database],
               username: config[:username],
               password: config[:password],
               out: file_path
    file_path
  end

  def pg_dump host:, port:, database:,
                  username:, password:,
                  out:
   raise 'Database is required' if database.blank?
   cmd = backup_cmd
   raise "pg_dump command not found" if cmd.blank?

   cmd << " -Ft"
   {h: host, p: port,
    U: username, f: out}.each do |name, value|
      cmd << " -#{name} #{Shellwords.escape(value)}" if value.present?
    end
    `PGPASSWORD=#{Shellwords.escape(password)} #{cmd} #{Shellwords.escape(database)}`
  end

  #include name
  def file_path
    @backup_file ||= Rails.root.join('tmp', filename)
  end

  def filename
    "db-#{Time.current.beginning_of_minute.to_s(:number)}.tar"
  end

  def upload_to_s3 file_path
    file_name = file_path.to_s.rpartition("/").last
    key       = to_s3_file_name(file_name)
    object    = bucket.object(key)
    object.upload_file file_path
  end

  #s3 folder
  def s3_prefix
    "db"
  end

  def to_s3_file_name(filename)
    "#{s3_prefix}/#{filename}"
  end


  def remove_file file_name
    FileUtils.rm file_name
  end

  def restore_db(file_name)
    out = pg_restore  host: config[:host],
                port: config[:port],
                database: config[:database],
                username: config[:username],
                password: config[:password],
                in_file: file_name

    file_path
  end



end
