# app/middleware/auth_middleware.rb
class AuthMiddleware
    def initialize(app)
      @app = app
    end
  
    def call(env)
      if env['HTTP_AUTHORIZATION'].present? && env['HTTP_AUTHORIZATION'].split(' ').first == 'Bearer'
        token = env['HTTP_AUTHORIZATION'].split(' ').last
        begin
          decoded_token = JwtService.decode(token)
          env[:user] = User.find(decoded_token[:user_id])
        rescue JWT::ExpiredSignature
          return [403, {}, ['Token expired']]
        rescue JWT::DecodeError
          return [401, {}, ['Invalid token']]
        end
      end
      @app.call(env)
    end
  end
  