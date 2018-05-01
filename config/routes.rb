Rails.application.routes.draw do


  resources :schedules
  devise_for :users, :path => 'users'


  namespace :v1 do
    # get 'api/getAllLanguages/:userId' => 'api#getAllLanguages'
    # post '/api/search'
    post '/api/createSubject'
    post '/api/createLanguage'
    post '/api/createEducation'
    post '/api/createWorkExperience'
    post '/api/createComputerSkill'
    post '/api/createProffesionalSkill'
    get '/api/getStudentId/:studentId/:labId' => 'api#getStudentId'

  end
# , :defaults => {:format => :json}
  resources :groups

  resources :users do
    # get 'languages/index'
    # resources :languages
    # get 'language/edit' => 'language#edit'
    # get 'language/destroy/:id' => 'language#delete'
    # resources :languages
    resources :subjects
    resources :curriculums
    resources :user_languages
    resources :computer_skills
    resources :educations
    resources :proffesional_skills
    resources :work_experiences


    # post 'language/destroy'
    # post '/languages/update/:langId' => 'languages#update'
    get 'users/search'
    get 'users/ams_data'
    get 'users/profile'
    get 'user/student'
    get 'user/teacher'
    get 'user/admin'
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
