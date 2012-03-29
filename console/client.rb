require 'dropbox_sdk'

module Console
  class Client
    attr_reader :dropbox_client

    def initialize(session)
      @dropbox_client = DropboxClient.new(session.dropbox_session, session.access_type)
    end

    def help
      puts "methods: " + self.class.instance_methods(false).sort.join(' ')
    end

    def ls(path = '/')
      metadata = @dropbox_client.metadata(path)
      metadata['contents'].each {|file| puts file['path']}
    end

    def mv(src, dest)
      @dropbox_client.file_move(src, dest)
    end

    def cp(src, dest)
      @dropbox_client.file_move(src, dest)
    end

    def mkdir(dir)
      @dropbox_client.file_create_folder(dir)
    end

    def rm(file)
      @dropbox_client.file_delete(file)
    end

    def search(str)
      results = @dropbox_client.search('/', str)
      results.each {|result| puts result['path']}
    end

    def info
      puts @dropbox_client.account_info
    end
  end
end
