class MoveAdminUsersToAdmin < Mongoid::Migration
  def self.up
    #get the mongo database instance from the Mongoid::Document
    mongo_db = User.db

    admin_users = mongo_db.collection("users").find({admin:true})

    admin_users.each do |user|
      mongo_db.collection("admins").save(user)
      mongo_db.collection("users").remove({"_id" => user["_id"]})
    end
  end

  def self.down
  end
end