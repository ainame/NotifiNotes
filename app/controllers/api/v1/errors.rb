module Api
  module V1
    module Errors
      def self.included(base)
        base.instance_eval do
          rescue_from ActiveRecord::RecordNotFound do |error|
            render json: { message: 'recrod not found' }, status: 404
          end
        end
      end
    end
  end
end
