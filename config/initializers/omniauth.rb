Rails.application.config.middleware.use OmniAuth::Builder do
  provider :paypal, "AUeA1xAX9nsiOb2gntRXz5ZHQmJ9mKWqe_FzC5bftGUjFMWym40azDtMSxS6", "EIoeNRAUFNxnWvDweLYZ-NX_gF6gV9gPqbob08aO7yWnpU-Xz3DdnYy_EuHc", sandbox: true, scope: "openid profile email"
end