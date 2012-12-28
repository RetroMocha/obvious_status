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
      action = ListUsers.new UserJack.new
      users = action.do
      puts 'Users:'
      users.each do |user|k
        puts "#{user[:handle]} - id: #{user[:id]}"
      end
    elsif entity == 'statuses'
      action = ListStatuses.new StatusJack.new
      statuses = action.do
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
      action = GetUser.new UserJack.new
      user = action.do :id => id.to_i
      puts 'User:'
      puts "#{user[:handle]} - id: #{user[:id]}"
    elsif entity == 'status'
      action = GetStatus.new StatusJack.new
      status = action.do :id => id.to_i
      puts 'Status:'
      puts "#{status[:text]} - status id: #{status[:id]} user id: #{status[:user_id]}"
    end
  end
end

command :create do |c|
  c.action do |args, options|
    entity = args[0]
    if entity == 'user'
      action = CreateUser.new UserJack.new
      user = action.do :handle => args[1]
      puts 'New User:'
      puts "#{user[:handle]} - id: #{user[:id]}"
    elsif entity == 'status'
      action = CreateStatus.new StatusJack.new
      status = action.do :user_id => args[1].to_i, :text => args[2]
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
      action = UpdateStatus.new StatusJack.new
      status = action.do :id => args[1].to_i, :user_id => args[2].to_i, :text => args[3]
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
      action = RemoveStatus.new StatusJack.new
      status = action.do :id => args[1].to_i
      puts 'Status Removed'
    end
  end
end
