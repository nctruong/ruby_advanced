module ManageDatabase
  class RestoreJob < Struct.new(:key)
    QUEUE_NAME = 'restore_database_queue'

    def queue_name
      QUEUE_NAME
    end

    def perform
      DbBackup.new.restore key
    end

    def max_attempts
      0
    end
  end
end
