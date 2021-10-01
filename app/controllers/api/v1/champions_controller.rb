# frozen_string_literal: true

# This is a comment
module Api
  module V1
    # This is a comment
    class ChampionsController < ApplicationController
      before_action :find_champion, only: %i[show update destroy]

      def index
        champions = Champion.order('name')
        render json: {
          status: 'Success',
          message: 'All champions',
          data: champions
        }, status: :ok
      end

      def show
        render json: {
          status: 'Success',
          message: 'Show champion',
          data: @champion
        }, status: :ok
      end

      def create
        champion = Champion.new(champions_params)
        if champion.save
          render_json('Success', 'Champion saved success', @champion, :created)
        else
          render_json('Failed', 'Champion not saved', @champion.errors.full_messages, :unprocessable_entity)
        end
      end

      def update
        debugger
        if @champion.update(champions_params)
          render_json('Success', 'Champion updated success', @champion, :ok)
        else
          render_json('Failed', 'Champion not updated', @champion.errors.full_messages, :unprocessable_entity)
        end
      end

      def destroy
        if @champion.destroy
          render_json('Success', 'Champion deleted success', @champion, :ok)
        else
          render_json('Failed', 'Champion not deleted', @champion.errors.full_messages, :unprocessable_entity)
        end
      end

      private

      def find_champion
        @champion = Champion.find(params[:id])
      end

      def champions_params
        params.permit(:name, :region, :rol, :comp)
      end

      def render_json(status_message, message, data, status)
        render json: {
          status: status_message,
          message: message,
          data: data
        }, status: status
      end
    end
  end
end
