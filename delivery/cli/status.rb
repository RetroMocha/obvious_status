#!/usr/bin/env ruby

require 'commander/import'

require_relative '../../app/actions/list_statuses'
require_relative '../../app/actions/create_status'
require_relative '../../app/actions/get_status'
require_relative '../../app/actions/update_status'
require_relative '../../app/actions/remove_status'

require_relative '../../app/actions/get_user'
require_relative '../../app/actions/list_users'
require_relative '../../app/actions/create_user'

require_relative '../../external/status_jack'
require_relative '../../external/user_jack'

program :name, 'Status'
program :version, '1.0'
program :description, 'This is a cli version of Status'

command :list do |c|
  c.action do |args, options|
    entity = args[0]
    if entity == 'users'
      list_users = ListUsers.new UserJack.new
      users = list_users.execute
      puts 'Users:'
      users.each do |user|k
        puts "#{user[:handle]} - id: #{user[:id]}"
      end
    elsif entity == 'statuses'
      list_statuses = ListStatuses.new StatusJack.new
      statuses = list_statuses.execute
      puts 'Statuses:'
      statuses.each do |status|
        puts "#{status[:text]} - status id: #{status[:id]} user id: #{status[:user_id]}"
      end
    end
  end
end

command :get do |c|
  c.action do |args, options|
    entity = args[0]
    id = args[1]
    if entity == 'user'
      get_user = GetUser.new UserJack.new
      user = get_user.execute where_id: id.to_i
      puts 'User:'
      puts "#{user[:handle]} - id: #{user[:id]}"
    elsif entity == 'status'
      get_status = GetStatus.new StatusJack.new
      status = get_status.execute where_id: id.to_i
      puts 'Status:'
      puts "#{status[:text]} - status id: #{status[:id]} user id: #{status[:user_id]}"
    end
  end
end

command :create do |c|
  c.action do |args, options|
    entity = args[0]
    if entity == 'user'
      create_user = CreateUser.new UserJack.new
      user = create_user.execute with_user_handle: args[1]
      puts 'New User:'
      puts "#{user[:handle]} - id: #{user[:id]}"
    elsif entity == 'status'
      create_status = CreateStatus.new StatusJack.new
      status = create_status.execute with_user_id: args[1].to_i, and_text: args[2]
      puts 'Status:'
      puts "#{status[:text]} - status id: #{status[:id]} user id: #{status[:user_id]}"
    end
  end
end

command :update do |c|
  c.action do |args, options|
    entity = args[0]
    if entity == 'user'
      # we don't update users now, but we might later
    elsif entity == 'status'
      update_status = UpdateStatus.new StatusJack.new
      status = update_status.execute for_status_id: args[1].to_i, with_text: args[3], and_user_id: args[2].to_i 
      puts 'Status:'
      puts "#{status[:text]} - status id: #{status[:id]} user id: #{status[:user_id]}"
    end
  end
end


command :remove do |c|
  c.action do |args, options|
    entity = args[0]
    if entity == 'user'
      # we don't update users now, but we might later
    elsif entity == 'status'
      remove_status = RemoveStatus.new StatusJack.new
      status = remove_status.execute where_id: args[1].to_i
      puts 'Status Removed'
    end
  end
end
