require_relative '../lib/database_connection'

describe DatabaseConnection do
  let(:name) { 'bookmark_manager_test' }

  context ".setup" do
    it "makes a connection to a database" do
      expect(PG).to receive(:connect).with(dbname: name)
      DatabaseConnection.setup(name: name)
    end

    it 'sets ups a persistent connection' do
      connection = DatabaseConnection.setup(name: name)
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  context ".query" do
    it "send a sql query through the connection" do
      connection = DatabaseConnection.setup(name: name)
      sql = 'SELECT * FROM bookmarks;'
      expect(connection).to receive(:exec_params).with(sql, ['hello'])
      DatabaseConnection.query(sql: sql, params: ['hello'])
    end
  end
end
