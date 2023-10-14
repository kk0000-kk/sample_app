# frozen_string_literal: true

Rails.application.routes.draw do
  root 'application#hello'
  get 'static_pages/home'
  get 'static_pages/help'
end
