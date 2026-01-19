class InitializeSolidStack < ActiveRecord::Migration[8.1]
  def up
    load Rails.root.join("db/cache_schema.rb")
    load Rails.root.join("db/queue_schema.rb")
    load Rails.root.join("db/cable_schema.rb")
  end
end
