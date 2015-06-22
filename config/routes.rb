CodingTest::Application.routes.draw do
  resources :updates
  root to: "updates#new"
end
