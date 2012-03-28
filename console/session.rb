require 'yaml'
require 'dropbox_sdk'

module Console
  class Session
    attr_reader :access_type, :dropbox_session

    def initialize(options={})
      config = load_config || create_config
      @access_type = options[:access_type] || config['access_type']
      @dropbox_session = create_session(config)
    end

    def load_config
      YAML.load_file("config.yml")
    rescue Errno::ENOENT
      puts "Can't find config.yml"
      nil
    end

    def create_config
      config = {'access_type' => :app_folder}
      puts "A config.yml file needs to be created"
      puts "Please enter the app key"
      app_key = gets.strip

      puts "Please enter the app secret"
      app_secret = gets.strip

      session = DropboxSession.new(app_key, app_secret)
      puts "Please visit #{session.get_authorize_url} to authorize, then press enter"
      gets
      session.get_access_token

      config['app_key'] = app_key
      config['app_secret'] = app_secret
      config['access_token_key'] = session.access_token.key
      config['access_token_secret'] = session.access_token.secret

      puts "Writing file: config.yml"
      File.open('./config.yml', 'w') {|file| file.write(config.to_yaml)}

      config
    end

    def create_session(config)
      session = DropboxSession.new(config['app_key'], config['app_secret'])
      session.set_access_token(config['access_token_key'], config['access_token_secret'])
      session if session.authorized?
    end

    def create_client(session, access_type)
      client = DropboxClient.new(session, access_type)
    end
  end
end
