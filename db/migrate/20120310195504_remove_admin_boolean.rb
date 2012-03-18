class RemoveAdminBoolean < Mongoid::Migration
  def self.up
    #get the mongo database instance from the Mongoid::Document
    mongo_db = User.db

    users_with_admin_property = mongo_db.collection("users").find({"admin" => { "$exists" => true}})
    admin_with_admin_property = mongo_db.collection("admins").find({"admin" => { "$exists" => true}})

    users_with_admin_property.each do |user|
      mongo_db.collection("users").update({"_id" => user["_id"]}, { "$unset" => {"admin" => 1}})
    end
    admin_with_admin_property.each do |user|
      mongo_db.collection("users").update({"_id" => user["_id"]}, { "$unset" => {"admin" => 1}})
    end
  end

  def self.down
  end
end