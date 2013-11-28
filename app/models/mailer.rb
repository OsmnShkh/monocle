require 'dedent'

module Brisk
  module Models
    module Mailer extend self
      def user_invite!(invite)
        Mail.deliver do
          from    'eevents <alex@example.com>'
          to      invite.email
          subject "An invitation to join eevents from #{invite.user_name}."
          body    <<-EOF.dedent
            Hi there,

            #{invite.user_name} has invited you to join eevents, an upbeat community.

            To learn more, and claim your invitation, visit:

            \thttp://example.com/claim/#{invite.code}

            Thanks,
            Admin
          EOF
        end
      end

      def user_activate!(user)
        Mail.deliver do
          from    'eevents <alex@example.com>'
          to      user.email
          subject 'Welcome to eevents!'
          body    <<-EOF.dedent
            Hi there,

            Good news! #{user.parent_name || 'Admin'} has activated your eevents account.

            Thanks,
            Admin
          EOF
        end
      end

      def feedback!(text, email = nil)
        Mail.deliver do
          from    'eevents <system@example.com>'
          to      'alex@example.com'
          subject 'eevents Feedback'
          reply_to email if email.present?
          body     text

          charset = 'UTF-8'
          content_transfer_encoding = '8bit'
        end
      end
    end
  end
end