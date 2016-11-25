class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :mailbox, :conversation

  def create
    recipient_emails = conversation_params(:recipients).split(',')
    recipients = User.where(email: recipient_emails).all

    conversation = current_user.
      send_message(recipients, *conversation_params(:body, :subject)).conversation

    redirect_to conversations_path
  end

#message = current_user.mailbox.inbox.last.receipts_for(a).first.message
#senders_email = mailbox.inbox.last.receipts_for(a).first.message.sender.email
#conversation_receipts = conversation.receipts_for(current_user)

  def show
    @conversation_subject = conversation.subject
    @current_user_nick = current_user.email[0]
    render 'show', layout: 'chat_layout'
  end

  def index
    @no_message = current_user.mailbox.conversations.count < 1
    render 'index', layout: 'conversations_layout'
    # @last_received_conversation = current_user.mailbox.inbox.last.receipts_for(current_user).first.message
  end


  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation_path(conversation, anchor: 'after_all_messages')
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end

end
