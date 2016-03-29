require 'namely'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :namely, '7524a873efc4e72615506f27a3e15b50', 'a7c271b17eba6bc0f0691e21c9b3ea1887a9c181c3cd2a08930fb6548f8e7c54'
end

