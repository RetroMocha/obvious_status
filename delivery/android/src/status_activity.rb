require 'ruboto/widget'
require 'ruboto/util/toast'
require 'ruboto/util/stack'

require 'app/actions/list_statuses'

require 'external/status_jack'


ruboto_import_widgets :Button, :LinearLayout, :TextView

class StatusActivity
  def on_create(bundle)
    super
    set_title 'Obvious Status'

    self.content_view =
        linear_layout :orientation => :vertical do
          @text_view = text_view :text => 'Hrm?', :id => 42, :width => :match_parent,
                                 :gravity => :center, :text_size => 48.0
          button :text => 'Post Status', :width => :match_parent, :id => 43, :on_click_listener => proc { butterfly }
        end
  rescue
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  private

  def butterfly
    action = ListStatuses.new StatusJack.new

    with_large_stack(1024){ result = action.do }

        @text_view.text = result
    #@text_view.text = 'What is your status?'
    toast 'I like toast and cheese! bacon? taco.'
  end

end
