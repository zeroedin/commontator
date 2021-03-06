module Commontator
  class SubscriptionsController < Commontator::ApplicationController
    before_filter :get_thread

    # PUT /threads/1/subscribe
    def subscribe
      raise SecurityTransgression unless @thread.can_subscribe?(@user)

      @thread.errors.add(:base, t('commontator.subscription.errors.already_subscribed')) \
        unless @thread.subscribe(@user)

      respond_to do |format|
        format.html { redirect_to @thread }
        format.js { render :subscribe }
      end

    end

    # PUT /threads/1/unsubscribe
    def unsubscribe
      raise SecurityTransgression unless @thread.can_subscribe?(@user)

      @thread.errors.add(:base, t('commontator.subscription.errors.not_subscribed')) \
        unless @thread.unsubscribe(@user)

      respond_to do |format|
        format.html { redirect_to @thread }
        format.js { render :subscribe }
      end
    end
  end
end
