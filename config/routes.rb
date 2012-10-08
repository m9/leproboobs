# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/').to(HomeAction)
  add('/boobs.jpg').to(RedirectAction)
  add('/b.jpg').to(RedirectAction)
end
