class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!
    berore_action :set_twitter_account

    def index
        @twitter_accounts = Current.user.twitter_accounts, only: [:destroy]
    end

    def show
    end

    def destroy
        @twitter_account = Current.user.twitter_accounts.find(params[:id])
        @twitter_account.destroy
        redirect_to twitter_accounts_path, notice: "Successfully disconnected @#{@twitter_account.username}"
    end

    private

    def set_twitter_account
        @twitter_account = Current.user.twitter.twitter_accounts.find(params[:id])
    end
end