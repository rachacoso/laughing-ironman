Rails.application.routes.draw do

root 'home#front'
get '/404audit', :to => redirect('/404audit.html')

get '/login' => 'session#new', as: 'login'
post '/login' => 'session#create'
get '/logout' => 'session#destroy', as: 'logout'

resources :audits, only: [:new, :create, :index, :destroy, :update]
get 'audits/:id/edit/:subtype' => 'audits#edit', as: 'edit_audit'

resources :five_minute_summaries, only: [:show, :edit, :update]
resources :content_blocks, only: [:edit, :update, :destroy]
resources :background_photos, only: [:show, :destroy]

resources :users, only: [:new, :create, :edit, :update, :destroy, :index]

get '/shared_media_library' => 'shared_media_library#index', as: 'shared_media_library'
get '/shared_media_library/:id' => 'shared_media_library#show', as: 'shared_media_library_item'
post '/shared_media_library' => 'shared_media_library#create'
delete '/shared_media_library/:id' => 'shared_media_library#destroy'

get '/:audit_id/media_library' => 'media_library#index', as: 'media_library'
get '/:audit_id/media_library/:id' => 'media_library#show', as: 'media_library_item'
post '/:audit_id/media_library' => 'media_library#create'
delete '/:audit_id/media_library/:id' => 'media_library#destroy'


get '/content_blocks/new/:sectionid/:position' => 'content_blocks#new', as: 'new_content_block'
post '/content_blocks/new/:sectionid/:position' => 'content_blocks#create'

post '/content_blocks/cbhelper/:helper_type' => 'content_blocks#cbhelper', as: 'content_block_helper'

resources :full_audits, only: [:show, :edit, :update]
resources :sections, only: [:edit, :update, :destroy]

get '/sections/new/:full_audit_id/:position' => 'sections#new', as: 'new_section'
post '/sections/new/:full_audit_id/:position' => 'sections#create'

get 'publish/:switch/:id' => 'public_views#publish', as: 'publish'


get '/public/audits/:id/five_minute_summary' => 'public_views#fms', as: 'public_five_minute_summary'
get '/public/audits/:id/full_audit' => 'public_views#fa', as: 'public_full_audit'

end
