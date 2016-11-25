ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end


    columns do
      column do
        panel "Recent Conversations " do
          ul do
            ActiveAdmin.register User.all.each do |user|
              li user.email
              li user.mailbox.conversations.last.created_at
              li user.mailbox.conversations.last.last_message.body
              li
            end
          end
        end
      end
    end
  end
end