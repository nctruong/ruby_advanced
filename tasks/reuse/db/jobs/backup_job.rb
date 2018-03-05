module ManageDatabase
  class BackupJob
    QUEUE_NAME = 'backup_database_queue'

    def queue_name
      QUEUE_NAME
    end

    def perform
      DbBackup.new.backup
    end

    def max_attempts
      0
    end

  end
end
